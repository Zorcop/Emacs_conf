
;; the layouts
(defvar Dvorak  	"',.pyfgcrlaoeuidhtns;qjkxbmwvz")
(defvar Qwerty  	"qwertyuiopasdfghjkl;zxcvbnm,./")
(defvar Colemak		"qwfpgjluy;arstdhneiozxcvbkm,./")
(defvar ColemakDH	"qwfpbjluy;arstgmneiozxcdvkh,./")
(defvar Workman		"qdrwbjfup;ashtgyneiozxmcvkl,./")
(defvar Graphite	"bldwz,foujnrtsgyhaeiqxmcvkp.'/") ;this layout is very strange
(setq the_layouts (quote (Qwerty Dvorak Colemak ColemakDH Workman Graphite)))

(defvar my_current_layout Qwerty)
(defun set-my-lay (lay)
  "This is my function to setup the layout for evil (or for good)"
  (interactive (list (intern
					  (completing-read "Choose the layout: " the_layouts nil t))))
  (setq my_current_layout (eval lay))
  (reload-init-file))

(defun get_str_pos (str letr)
  (let ((i 0) (run t))
	(while (and (< i (length str))
				run)
	  (if (equal (string (aref str i))
				 letr)
		  (setq run nil)
		(setq i (+ i 1))))
	i))

(defun my_tran (key)
  (string (aref my_current_layout (get_str_pos Qwerty key))))

(provide 'layout_thing)
