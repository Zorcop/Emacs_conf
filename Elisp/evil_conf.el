(require 'evil)
(use-package evil

  :bind
  ("C-c v" . evil-local-mode)
  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (evil-set-initial-state 'dirvish-directory-view-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs))

;; main settings here
(setq evil-disable-insert-state-bindings t)
(defconst emodes '(normal visual motion))

(defun evil-map (key fun &optional bfun)
  (evil-define-key emodes 'global (kbd key) fun)
  (if bfun
      (evil-define-key emodes 'global (kbd (upcase key)) bfun)))

(defun lead-map (key fun &optional bfun)
  (evil-define-key emodes 'global (kbd (concat "<leader>" key)) fun)
  (if bfun
	  (evil-define-key emodes 'global (kbd (concat "<leader>" (upcase key))) bfun)))

(evil-set-leader emodes (kbd "SPC"))

(defun evil-map-t (key fun &optional bfun)
  (if bfun
	  (evil-map (my_tran key) fun bfun)
	(evil-map (my_tran key) fun)))

(defun lead-map-t (key fun &optional bfun)
  (if bfun
	  (lead-map (my_tran key) fun bfun)
	(lead-map (my_tran key) fun)))

;; THE FINAL SOLUTION OF THE LAYOUT QUESTION
;; get the places of the functions
(defvar my/evil_functions_map
  (let ((from Qwerty)
		(i 0)
		(funcs '())						;letters
		(bfuncs '())					;big letters
		(ofuncs '()))					;operators
	(while (< i 29)
	  (setq funcs (append funcs (list (or (keymap-lookup evil-normal-state-map (string (aref from i)))
										  (keymap-lookup evil-motion-state-map (string (aref from i)))))))
	  (setq bfuncs (append bfuncs (list (or (keymap-lookup evil-normal-state-map (upcase (string (aref from i))))
											(keymap-lookup evil-motion-state-map (upcase (string (aref from i))))))))
	  (setq ofuncs (append ofuncs (list (keymap-lookup evil-operator-state-map (string (aref from i))))))
	  (setq i (+ i 1)))
	(list funcs bfuncs ofuncs)))

;;set them on the right plac;; e
(let ((i 0) (to my_current_layout)
	  (funcs (nth 0 my/evil_functions_map))
	  (bfuncs (nth 1 my/evil_functions_map))
	  (ofuncs (nth 2 my/evil_functions_map)))
  (while (< i 29)
	(evil-map (string (aref to i)) (nth i funcs) (nth i bfuncs)) ; letters
	(keymap-set evil-operator-state-map (string (aref to i)) (nth i ofuncs)) ; operators
	(setq i (+ i 1))))

(defun my/evil-restore-emacs-ctrl-bindings ()
  "Override Evil's Normal state C- bindings with Emacs' global ones."
  (map-keymap
   (lambda (key def)
     ;; Ctrl keys are represented as integers 1–26 (C-a = 1, C-z = 26)
     (when (and (integerp key) (<= 1 key 36))
       (let* ((key-vector (vector key))
              (emacs-cmd (lookup-key global-map key-vector)))
         (when emacs-cmd
           (define-key evil-insert-state-map key-vector emacs-cmd)
		  (define-key evil-normal-state-map key-vector emacs-cmd) ))))
   (current-global-map)))

(my/evil-restore-emacs-ctrl-bindings)

(evil-define-command evil-goto-mark-line (char)
  :keep-visual t
  :repeat nil
  :type line
  :jump t
  (interactive (list (read-char)))
  (evil-goto-mark char))

;;; leader keymaps
(lead-map "s" #'save-buffer #'save-some-buffers)
(lead-map "b" #'switch-to-buffer)
(lead-map "d" #'dirvish)
(lead-map "." #'tab-bar-switch-to-next-tab)
(lead-map "," #'tab-bar-switch-to-prev-tab)
(lead-map "t" #'my-tab-map)
(lead-map "r" #'compile #'recompile)
(lead-map "q" #'evil-mode)
(lead-map "v" #'vterm-other-window)
(lead-map "g" #'execute-extended-command)

;; this works only with colemak, should do something with it
(lead-map-t "h" #'windmove-left)
(lead-map-t "j" #'windmove-down)
(lead-map-t "k" #'windmove-up)
(lead-map-t "l" #'windmove-right)

(evil-map "C-v" #'evil-visual-block)
(evil-map "g" #'Control-X-prefix #'mode-specific-command-prefix)

(setq evil-insert-state-cursor '(bar "yellow")
      evil-normal-state-cursor '(box "yellow"))

(message "evil settings are loaded"	)
