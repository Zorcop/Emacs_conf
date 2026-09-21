;; Org thing
(setq org-startup-indented t)
(setq org-support-shift-select t)
(setq org-preview-latex-default-process 'dvisvgm)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))
(global-org-modern-mode)
(with-eval-after-load 'org
  (add-to-list 'org-latex-packages-alist '("" "chemfig")))
(setq org-modern-star '("●" "○" "●" "○" "●"))
(setq org-agenda-files '("/home/zorcop/.emacs.d/org/tasks.org"))
(add-hook 'org-mode-hook
	  #'visual-line-mode)
(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-agenda-tags-column 0
 org-ellipsis "…")
