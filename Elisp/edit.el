
(defvar edit-keymap (make-sparse-keymap))
(define-minor-mode edit-mode
  "Vim kinda thing. "
  :lighter "<edit>"
  :keymap edit-keymap

  (if edit-mode
      (progn
        (message "entered edit mode")
        ;; Example: change cursor color, enable something, etc.
        (setq cursor-type 'box))
    (progn
      (message "exited edit mode")
      (setq cursor-type 'bar))))

(defun edit-exit ()
  (interactive)
  (if edit-mode
	  (progn
		(message "Exited edit mode")
		(edit-mode 0)
		(setq cursor-type 'bar))))

(defvar edit-operator-mode nil)
(defvar edit-current-op-fun nil)

;; operand here is a special command that takes in a motion before execution
;; hence the name
(defun edit-operand-exec (f)
  (message (format "%s" f))
  (if (region-active-p)
	  (let ((a (region-beginning)) (b (region-end)))
		(funcall f a b))
	(setq edit-operator-mode t)
	(setq edit-current-op-fun f)))

(defun edit-set-mark ()
  (interactive)
  (push-mark)
  (if (region-active-p)			  ;basically: if visual mode is active
      (progn
        (deactivate-mark)
        (message "Mark deactivated"))
    (activate-mark)
    (message "Mark activated")))

;; counting
(defvar edit-operator-count nil)

(defun edit-op-add-digit (dig)
  (setq edit-operator-count
		(+ (* (or edit-operator-count 0) 10) dig)))

(defun edit-consume-count ()
  (let ((count (or edit-operator-count 1)))
	(setq edit-operator-count nil)
	count))

(defun edit-do-motion (fun)
  (interactive)
  (if edit-operator-mode
	  (progn
		(setq edit-operator-mode nil)
		(edit-set-mark)
		(funcall fun (edit-consume-count))
		(let ((a (region-beginning)) (b (region-end)))
		  (funcall edit-current-op-fun a b))
		(setq edit-current-op-fun nil))
	(funcall fun (edit-consume-count))))

;; now registers
(defvar edit-register-mode nil)			;if register mode is active do register stuff

(defun edit-set-reg-fun ()
  (interactive)
  ())

(defun edit-set-motion (key fun)
  (keymap-set edit-keymap key `(lambda () (interactive)
								 (edit-do-motion #',fun))))

(defun edit-set-operand (key fun)
  (keymap-set edit-keymap key
			  `(lambda () (interactive) (edit-operand-exec #',fun))))

;; Keymaps 
(keymap-set edit-keymap "s" #'edit-exit) ;inSert mode
(keymap-set edit-keymap "," #'undo)
(keymap-set edit-keymap "." #'undo-redo)
(keymap-set edit-keymap ";" #'execute-extended-command)
(keymap-set edit-keymap "p" #'yank)

;; hjkl
(edit-set-motion "m" #'backward-char)
(edit-set-motion "n" #'next-line)
(edit-set-motion "e" #'previous-line)
(edit-set-motion "i" #'forward-char)
;; other motions
(edit-set-motion "w" #'forward-word)
(edit-set-motion "b" #'backward-word)
(edit-set-motion "{" #'backward-paragraph)
(edit-set-motion "}" #'forward-paragraph)
(edit-set-motion "o" #'move-end-of-line)
(edit-set-motion "u" #'move-beginning-of-line)
(keymap-set edit-keymap "O" (lambda () (interactive)
							  (move-end-of-line nil) (newline) (edit-exit)))
(keymap-set edit-keymap "U" (lambda () (interactive)
							  (previous-line) (move-end-of-line nil) (newline) (edit-exit)))
;; visual mode
(keymap-set edit-keymap "v" #'edit-set-mark)
;; operand functions
(edit-set-operand "y" #'kill-ring-save)
(edit-set-operand "d" #'kill-region)
(edit-set-operand "c" (lambda (a b) (kill-region a b) (edit-exit)))
;; register operand functions
;;; ...
;; digit
(dotimes (i 10)
  (keymap-set edit-keymap (number-to-string i)
			  `(lambda () (interactive) (edit-op-add-digit ,i))))
;; toggle it
;(global-set-key (kbd "<escape>") #'edit-mode)

