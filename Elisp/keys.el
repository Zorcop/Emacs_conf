;; keymaps

(keymap-global-set "C-c @" 'apply-macro-to-regexp-matches)
(keymap-global-set "C-c r" 'reload-init-file)
(keymap-global-set "M-o" 'previous-window-any-frame)
(keymap-global-set "C-," 'undo)
(keymap-global-set "C-." 'undo-redo)
(keymap-global-set "M-Q" 'set-my-lay)

;;; phi thing
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)
(global-set-key (kbd "M-%") 'phi-replace-query)

;; org thing
(define-prefix-command 'my-org-latex-shortcut)
(keymap-set org-mode-map "M-;" my-org-latex-shortcut )
(keymap-global-set "C-c t" (kmacro "C-SPC C-SPC C-u M-| d a t e SPC <kp-add> \" % H : % M : % S \" <return> <backspace>"))


(defconst my-latex-shortcuts '(("a" "\\alpha") ("b" "\\beta") ("g" "\\gamma") ("G" "\\Gamma") ("d" "\\delta") ("D" "\\Delta") ("l" "\\lambda") ("L" "\\Lambda") ("o" "\\omega") ("O" "\\Omega") ("S" "\\Sigma") ("s" "\\sigma") ("C-s" "\\sum") ("f" "\\frac{") ("i" "\\int") ("m" "\\begin{matrix}") ("M" "\\end{matrix}") ("q" "\\sqrt{") ("C-b" "\\begin{") ("C-e" "\\end{") ("C-l" "\\limits_") ("C-i" "\\infty") ("p" "\\prod") ("<" "\\langle") (">" "\\rangle") ("(" "\\left") (")" "\\right") ("." "\\dots")))

(dolist (inp my-latex-shortcuts)
  (keymap-set my-org-latex-shortcut (car inp) `(lambda () (interactive)
												 (insert ,(cadr inp)))))

;; paredit
(keymap-set paredit-mode-map "C-<backspace>" #'backward-kill-sexp)
(keymap-set paredit-mode-map "C-<delete>" #'kill-sexp)

;; projectile
(keymap-set projectile-mode-map "C-c p" 'projectile-command-map)

(keymap-global-set "C-t" (keymap-lookup nil "C-x t"))
;; tab management
(define-prefix-command 'my-tab-map)
;(keymap-global-set "C-t" 'my-tab-map)

(keymap-global-set "C-<next>" 'tab-bar-switch-to-next-tab)
(keymap-global-set "C-<prior>" 'tab-bar-switch-to-prev-tab)
(keymap-global-set "C-S-<next>" 'tab-bar-move-tab)
(keymap-global-set "C-S-<prior>" 'tab-bar-move-tab-backward)

(keymap-set my-tab-map "n" 'tab-bar-switch-to-next-tab)
(keymap-set my-tab-map "p" 'tab-bar-switch-to-prev-tab)

(keymap-set my-tab-map "d" 'tab-bar-close-tab)
(keymap-set my-tab-map "t" 'tab-bar-new-tab)
(keymap-set my-tab-map "o" 'tab-bar-close-other-tabs)
(keymap-set my-tab-map "r" 'tab-bar-rename-tab)
(keymap-set my-tab-map "s" 'tab-bar-switch-to-tab)
(keymap-set my-tab-map "SPC" 'tab-bar-mode)

;; window management
(define-prefix-command 'my-window-map)
(keymap-global-set "C-c w" 'my-window-map)

(keymap-global-set "C-}" 'enlarge-window-horizontally)
(keymap-global-set "C-{" 'shrink-window-horizontally)
(keymap-global-set "C-^" 'enlarge-window)
(keymap-global-set "C-_" 'shrink-window)

(keymap-global-set "M-<down>" 'windmove-down)
(keymap-global-set "M-<up>" 'windmove-up)
(keymap-global-set "M-<left>" 'windmove-left)
(keymap-global-set "M-<right>" 'windmove-right)

(keymap-set my-window-map "m" 'windowmove-down)
(keymap-set my-window-map "n" 'windowmove-up)
(keymap-set my-window-map "e" 'windowmove-left)
(keymap-set my-window-map "i" 'windowmove-right)

(keymap-set my-window-map "d" 'delete-window)
(keymap-set my-window-map "s" 'split-window-right)
(keymap-set my-window-map "v" 'split-window-below)
(keymap-set my-window-map "o" 'delete-other-windows)

(keymap-set my-window-map "C-d" 'delete-frame)
(keymap-set my-window-map "C-s" 'make-frame)
(keymap-set my-window-map "C-o" 'delete-other-frames)
(keymap-set my-window-map "C-n" 'next-window-any-frame)

;; secondary window commands
(define-prefix-command 'my-other-window-map)
(keymap-global-set "C-c W" 'my-other-window-map)

(keymap-set my-other-window-map "b" 'switch-to-buffer-other-window)
(keymap-set my-other-window-map "o" 'display-buffer)
(keymap-set my-other-window-map "f" 'find-file-other-window)
(keymap-set my-other-window-map "r" 'find-file-read-only-other-window)
(keymap-set my-other-window-map "d" 'dired-other-window)
(keymap-set my-other-window-map "." 'xref-find-definitions-other-window)

(keymap-set my-other-window-map "C-b" 'switch-to-buffer-other-frame)
(keymap-set my-other-window-map "C-o" 'display-buffer-other-frame)
(keymap-set my-other-window-map "C-f" 'find-file-other-frame)
(keymap-set my-other-window-map "C-r" 'find-file-read-only-other-frame)
(keymap-set my-other-window-map "C-d" 'dired-other-frame)
(keymap-set my-other-window-map "C-." 'xref-find-definitions-other-frame)

;; multiple cursors
(define-prefix-command 'my-mult-curs-mod)
(keymap-global-set "C-c n" 'my-mult-curs-mod)

(keymap-global-set "<mouse-2>" 'mc/add-cursor-on-click)
(keymap-global-set "C->" 'mc/mark-next-like-this)
(keymap-global-set "C-<" 'mc/mark-previous-like-this)

(keymap-set my-mult-curs-mod "l" 'mc/edit-lines)
(keymap-set my-mult-curs-mod "a" 'mc/mark-all-like-this)
(keymap-set my-mult-curs-mod "s" 'mc/mark-more-like-this-extended)
(keymap-set my-mult-curs-mod "r" 'mc/mark-all-in-region)
(keymap-set my-mult-curs-mod "C-r" 'mc/mark-all-in-region-regexp)
(keymap-set my-mult-curs-mod "b" 'mc/edit-beginnings-of-lines)
(keymap-set my-mult-curs-mod "e" 'mc/edit-ends-of-lines)

;; treemacs
(keymap-global-set "C-c e" 'treemacs)
(keymap-set treemacs-mode-map "j" 'treemacs-next-line)
(keymap-set treemacs-mode-map "k" 'treemacs-previous-line)

;; dired
(keymap-global-set "C-x C-d" 'dirvish)
;; (keymap-set dired-mode-map (my_tran "h") 'dired-up-directory)
;; (keymap-set dired-mode-map (my_tran "l") 'dired-find-file)
;; (keymap-set dired-mode-map (my_tran "j") 'dired-next-line)
;; (keymap-set dired-mode-map (my_tran "k") 'dired-previous-line)
;; (keymap-set dired-mode-map (my_tran "f") 'dired-create-empty-file)
;; (keymap-set dired-mode-map "d" 'dired-del-marker)
