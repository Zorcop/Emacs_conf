;; requirenments
(require 'dired)
(require 'org)
(require 'multiple-cursors)
(require 'treemacs)
(require 'eglot)
(require 'company)

;; loading modules from site-lisp
(mapcar (lambda (dir) (add-to-list 'load-path (expand-file-name (concat "site-lisp/" dir) user-emacs-directory)))
		(directory-files "/home/zorcop/.emacs.d/site-lisp" nil directory-files-no-dot-files-regexp))

;; second-hand
(require 'slime)
(require 'esxml)
(require 'nov)
(require 'paredit)
(use-package paredit
  :hook ((emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode) . paredit-mode))
(require 'rainbow-delimiters)
(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode) . rainbow-delimiters-mode))
(require 'smartparens)
(use-package smartparens
  :hook ((python-mode c-mode c++-mode haskell-mode) . smartparens-mode))
(require 'haskell)
(require 'projectile)
(require 'org-modern)
(require 'nerd-icons)
(require 'vterm)
(require 'phi-search)
(require 'phi-replace)
(add-to-list 'load-path "~/.emacs.d/site-lisp/elisp-tree-sitter/core")
(add-to-list 'load-path "~/.emacs.d/site-lisp/elisp-tree-sitter/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/elisp-tree-sitter/langs")
(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)
(require 'combobulate)


;; optimisations
(setq completion-ignore-case t)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 80000000 ; ~80MB
                  gc-cons-percentage 0.1)))

;; my loads
(add-to-list 'load-path	(expand-file-name "Elisp" user-emacs-directory))
(load "layouts")
(load "defuns")
(load "keys")
(load "evil_conf")
(load "edit")
(load "vertico_conf")
(load "rust")
(load "cpp")
(load "sql_conf")
(load "doom_modeline_conf")
(load "org_conf")
(load "dirvish_conf")
(load "python_conf")
(load "corfu_conf")
(message "this executes")

;;; eglot settings
(setq eldoc-echo-area-use-multiline-p nil)

;; backups 
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq x-elisp-autostart-wm-session nil) ; For older Emacs versions
(setq emacs-save-session-functions nil) ; Disables the save hooks

;; the main settings
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(which-key-mode)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook #'dired-omit-mode)
(global-hl-line-mode 1)
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(blink-cursor-mode 0)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq eglot-send-changes-idle-time 0.1)
(setq company-idle-delay 0.2)
(setq debug-on-error nil)
(projectile-mode 1)
(set-fringe-mode '(2 . 1))
(setq scroll-conservatively 101
      scroll-preserve-screen-position t
      scroll-margin 5)
(setq dired-listing-switches "-Bhl --group-directories-first --almost-all")

(add-hook 'after-change-major-mode-hook
		  (lambda () (setq display-line-numbers 'relative)))
(setq dired-listing-switches "-la --group-directories-first")

(setq dired-omit-mode nil)
(remove-hook 'dired-mode-hook 'dired-omit-mode)

;; packages
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
		("gnu" . "https://elpa.gnu.org/packages/")
		("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; load custom variables
(setq custom-file "~/.emacs.d/Elisp/custom.el")
(load custom-file)

;;; MOSTLY APPEARANCE SETTINGS

(setq-default indent-tabs-mode t)
(electric-indent-mode 1)
(setq-default cursor-type 'box)

;; fonts
(add-to-list 'default-frame-alist '(font . "Iosevka"))
(set-face-attribute 'default nil :font "Iosevka" :height 100)
(set-face-attribute 'font-lock-comment-face nil
					:family "DejaVu Serif"
					:slant 'italic
					:foreground "#999999")
;; Force comment faces to inherit default height, removing any fixed size.
(set-face-attribute 'font-lock-comment-face nil :height 'unspecified)

(put 'set-goal-column 'disabled nil)
