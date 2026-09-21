(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "f6ea954a9544b0174a876d195387f444da441535ee88c7fb0fc346af08b0d228" "c07f072a88bed384e51833e09948a8ab7ca88ad0e8b5352334de6d80e502da8c" "19d62171e83f2d4d6f7c31fc0a6f437e8cec4543234f0548bad5d49be8e344cd" "be0d9f0e72a4ebc4a59c382168921b082b4dc15844bdaf1353c08157806b3321" "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1" default))
 '(eglot-connect-timeout 5)
 '(eglot-send-changes-idle-time 1)
 '(eldoc-documentation-strategy 'eldoc-documentation-enthusiast)
 '(eldoc-echo-area-display-truncation-message t)
 '(eldoc-idle-delay 0.0)
 '(package-selected-packages
   '(consult orderless marginalia slime vertico magit doom treemacs babel unicode-math-input org-moder org-modern evil projectile lsp-cfn lsp-mode auctex-lua pdf-tools org-fragtog multiple-cursors org-journal vterm ## which-key company))
 '(safe-local-variable-values
   '((vc-default-patch-addressee . "bug-gnu-emacs@gnu.org")
	 (etags-regen-ignores "test/manual/etags/")
	 (etags-regen-regexp-alist
	  (("c" "objc")
	   "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/" "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))))
 '(send-mail-function 'mailclient-send-it))




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "black" :foreground "white smoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 98 :width normal :foundry "UKWN" :family "Iosevka"))))
 '(ansi-color-blue ((t (:background "cyan" :foreground "cyan"))))
 '(child-frame-border ((t (:background "red" :foreground "white"))))
 '(cursor ((t (:background "yellow" :foreground "yellow"))))
 '(eglot-diagnostic-tag-deprecated-face ((t (:inherit shadow :strike-through "red"))))
 '(eglot-highlight-symbol-face ((t (:inherit bold :underline t))))
 '(eldoc-highlight-function-argument ((t (:background "dark green"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face :foreground "red"))))
 '(font-lock-builtin-face ((t (:foreground "pale goldenrod"))))
 '(font-lock-comment-face ((t (:foreground "gray" :slant oblique :height 95 :family "DejaVu Serif"))))
 '(font-lock-function-name-face ((t (:foreground "chartreuse2"))))
 '(font-lock-keyword-face ((t (:foreground "deep sky blue"))))
 '(font-lock-operator-face ((t (:foreground "light blue"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "orange"))))
 '(font-lock-string-face ((t (:foreground "medium spring green"))))
 '(font-lock-variable-name-face ((t (:foreground "cyan"))))
 '(fringe ((t (:background "black"))))
 '(hl-line ((t (:extend t :background "gray12"))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "yellow" :strike-through nil :weight bold))))
 '(lsp-signature-highlight-function-argument ((t (:inherit eldoc-highlight-function-argument :foreground "black"))))
 '(lsp-signature-posframe ((t (:inherit tooltip :background "black" :foreground "chartreuse"))))
 '(lsp-ui-doc-background ((t (:inherit tooltip :background "black" :foreground "black"))))
 '(lsp-ui-doc-header ((t (:background "#2d2d2d" :foreground "#ffffff"))))
 '(lsp-ui-doc-highlight-hover ((t (:inherit region :background "black" :foreground "orange"))))
 '(markdown-code-face ((t (:extend t :background "gray15"))))
 '(mc/cursor-bar-face ((t (:background "yellow" :foreground "yellow" :height 3))))
 '(mc/region-face ((t (:inherit region :stipple ""))))
 '(mode-line ((t (:background "grey25" :foreground "#f2fffc" :box (:line-width (1 . 1) :color "grey60" :style flat-button)))))
 '(mode-line-inactive ((t (:background "grey20" :foreground "#f2fffc" :box (:line-width (1 . 1) :color "grey35" :style flat-button)))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :family "Iosevka"))))
 '(org-level-2 ((t (:inherit outline-2 :extend nil))))
 '(org-list-bullet-string ((t (:inherit fixed-pitch))))
 '(org-table ((t (:foreground "#baa0f8" :family "Roboto Mono"))))
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "white smoke" :underline (:color "red" :style wave :position nil)))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "light gray"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange red"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "gold"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "plum"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "tan1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "cornflower blue"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#ff6d7e" :inverse-video t :weight bold))))
 '(region ((t (:extend t :background "dim gray"))))
 '(show-paren-match ((t (:foreground "white" :underline t))))
 '(show-paren-match-expression ((t (:background "gray12"))))
 '(tab-bar ((t (:background "gray14" :foreground "#1E2528"))))
 '(tab-bar-tab ((t (:background "gray20" :foreground "#f2fffc" :box (:line-width (1 . 1) :color "grey65" :style flat-button)))))
 '(tab-bar-tab-inactive ((t (:background "gray17" :foreground "#c6c6c6" :box (:line-width (1 . 1) :color "grey40" :style flat-button)))))
 '(tool-bar ((t (:background "yellow" :foreground "black"))))
 '(tooltip ((t (:background "#1e1e2e" :foreground "red"))))
 '(vertical-border ((t (:background "white" :foreground "dim gray"))))
 '(window-divider ((t (:foreground "dim gray"))))
 '(window-divider-last-pixel ((t (:foreground "white")))))
