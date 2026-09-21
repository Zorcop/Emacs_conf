;; python
(require 'python)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs
			 '(python-mode . ("pyright-langserver" "--stdio")))
