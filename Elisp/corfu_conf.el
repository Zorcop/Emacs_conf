(require 'corfu)
(add-to-list 'load-path "~/.emacs.d/site-lisp/corfu/extensions")
(require 'corfu-auto)
(require 'corfu-echo)
(require 'corfu-history)
(require 'corfu-indexed)
(require 'corfu-info)
(require 'corfu-mouse)
(require 'corfu-popupinfo)
(require 'corfu-quick)
(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.05)
  (corfu-auto-prefix 2)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
              ("RET" . corfu-insert)     ; Enter inserts the current selection
              ("<return>" . corfu-insert))) ; Handles GUI enter keys as well)

