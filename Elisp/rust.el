(require 'rust-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t)
  :config
  (add-to-list 'eglot-server-programs
               '(rust-mode . ("rust-analyzer" :initializationOptions
                              (:check (:command "clippy"))))))


(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'smartparens-mode)
