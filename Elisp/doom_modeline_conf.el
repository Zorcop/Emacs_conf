(require 'doom-modeline)
(require 'doom-modeline-segments)
(require 'shrink-path)
(use-package doom-modeline)

(doom-modeline-def-modeline 'my-simple-line
  '(bar buffer-info window-number )
  '(major-mode time))

;; Set as the default modeline
(add-hook 'doom-modeline-mode-hook
          (lambda ()
            (doom-modeline-set-modeline 'doom-modeline-format--my-simple-line t)))

(doom-modeline-set-modeline 'doom-modeline-format--my-simple-line t)

(setq doom-modeline-evil-state-tag t)     ; Show the full text tag (NORMAL/INSERT)
(doom-modeline-mode 1)
(message "doom_modeline executes")
