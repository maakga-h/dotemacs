(defun my-eshell-which-cmd (cmd)
  "which cmd, return 'which' result or nil"
  (let (
        (result (eshell-command-result (concat "which " cmd)))
        (re "which: no") ;; ^which: no cmd in
        )
    (if (string-match re result) nil result)
    ))

(defun my-eshell-which-cmd-head (cmd)
  ""
  (let (
        (paths (my-eshell-which-cmd cmd))
        )
    (if paths
        (car (split-string paths "\n" t))
        nil)
    ))

(defun my/fix-win-pathstr (str)
  "docstring"
  (let
	  ((path (replace-regexp-in-string "\\\\" "\/" str))
	   )
	(car (split-string path "\n" t))
	)
  )

(defun dominating-file (file)
  "find project root"
  (expand-file-name
   (locate-dominating-file default-directory file))
  )

(defun my--build-tags (dir)
  "do build tags in one dir"
  (eshell-command-result
   (format "fd \".*\\.lua|.*\\.c|.*\\.h|.*\\.cc\" %s | etags -o %s/TAGS -" dir dir))
  )

(defun my-build-tags ()
  ""
  (interactive)
  (my--build-tags (dominating-file ".git"))
  )

(defun my-rebuild-tags ()
  ""
  (interactive)
  (let ((dir (dominating-file ".git")))
	(and
	 (file-exists-p (concat dir "TAGS"))
	 (my--build-tags dir)
	 )
	)
  )

(provide 'init-misc)
