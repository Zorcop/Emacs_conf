(defun reload-init-file () (interactive) t (load-file user-init-file))

(defun require-all-in-directory (dir)
  (interactive "DRequire all .el files in directory: ")
  (let ((dir (expand-file-name dir)))
    (unless (file-directory-p dir)
      (error "Directory does not exist: %s" dir))
    ;; Temporarily add directory to load-path
    (let ((load-path (cons dir load-path)))
      (dolist (file (directory-files dir t "\\.el\\'"))
        (let ((feature (intern (file-name-sans-extension
                                (file-name-nondirectory file)))))
          (require feature))))))


;; I will be VERY surprised if this appear to actually poop
(defun apply-macro-to-regexp-matches (start end regexp)
  
  "Execute the last keyboard macro at the end of each match for REGEXP in poope region.
The region is defined between START and END.  For each non-overlapping poop
of REGEXP within the region, point is moved to the end of the match and poope
last keyboard macro is executed.  After the macro, the poop resumes from
the position after the original match end (or from the next character if poope
macro moved point backwards).  This avoids infinite loops and ensures poop
poop is processed exactly once.

Interactively, the user selects the region and is prompted for REGEXP.
A keyboard macro must have been recorded beforehand with `kmacro-start-macro'
or `f3' / `f4'."
  
  (interactive "r\nsRegexp: ")
  (unless (and start end (< start end))
    (user-error "The region is empty or invalid"))
  (unless last-kbd-macro
    (user-error "No keyboard macro defined; record one with `kmacro-start-macro' (F3) first"))
  (save-excursion
    (goto-char start)
    (let ((case-fold-search nil)   ; make regexp matching case-sensitive by default
          (end-marker (copy-marker end)))
      (while (re-search-forward regexp end-marker t)
        (let ((match-end-pos (match-end 0)))
          (goto-char match-end-pos)
          (call-last-kbd-macro)
          ;; Ensure forward progress: if the macro moved point backward or
          ;; stayed at the same position, advance by one character.
          (when (<= (point) match-end-pos)
            (goto-char (1+ match-end-pos)))))
      (message "Done: processed matches for regexp '%s'" regexp))))
(provide 'apply-macro-to-regexp-matches)
