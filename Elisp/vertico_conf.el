
;; ==============================================
;; MINIBUFFER COMPLETION (Vertico + Friends)
;; ==============================================
(require 'vertico)
(require 'marginalia)
(require 'orderless)
(require 'consult)
;; 1. VERTICO - The core vertical minibuffer UI
(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t)
  (setq vertico-resize t))

;; 2. MARGINALIA - Adds helpful descriptions to completions
(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))  ; Cycle through annotation styles
  :init
  (marginalia-mode 1))

;; 3. ORDERLESS - Powerful filtering (type "def fun" to find "defun")
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 4. CONSULT - Better versions of built-in commands
(use-package consult
  :bind
  (;; C-x bindings (buffer, file, etc.)
   ("C-x b" . consult-buffer)             ; Better switch-buffer
   ("C-x 4 b" . consult-buffer-other-window)
   ("C-x 5 b" . consult-buffer-other-frame)
   ("C-x r b" . consult-bookmark)         ; Jump to bookmarks
   ("C-x p b" . consult-project-buffer)   ; Switch to project buffers
   ("M-y" . consult-yank-pop)             ; Better yank popup (replace default)
   ("M-s f" . consult-find)               ; Find files via `find`
   ("M-s l" . consult-line)               ; Search in current buffer
   ("M-s L" . consult-line-multi)         ; Search across multiple buffers
   ("M-s g" . consult-grep)               ; Grep search
   ;; Help and navigation
   ("C-c h" . consult-history)            ; Buffer history
   ("C-c m" . consult-mode-command)       ; Commands for the current major mode
   ("<help> a" . consult-apropos))        ; Search help
  :init
  (setq consult-preview-key 'any)
  (setq consult-narrow-key "<"))         ; Press "<" to narrow by category

