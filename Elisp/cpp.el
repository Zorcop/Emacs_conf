(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; C/C++
(add-hook 'simpc-mode-hook #'eglot-ensure)
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs
			 '((c-mode c++-mode simpc-mode) . ("/home/zorcop/tools/lsp/clangd_22.1.0/bin/clangd")))

