(use-package s)

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
  (let ((dir (locate-dominating-file default-directory file)))
	(and dir
		 (expand-file-name dir)
		 )
	  )
  ;; (expand-file-name
  ;;  (locate-dominating-file default-directory file))
  )

;;(mapconcat (lambda (x) (format ".*\\.%s\\$" x)) '(lua cc h) "|")
(defun my--build-tags-types (files)
  ""
  (let ((re (mapconcat (lambda (x) (format ".*\\.%s\\$" x)) files "|"))
		(dir (dominating-file ".git")))
	(eshell-command-result
	 (format "cd %s && fd %s | etags -" dir ))
	)
  )

(defun my-build-tags-lua()
  ""
  (interactive)
  (my--build-tags-types '("lua" "c" "h" "cc"))
  )

;; (defun my--build-tags-types (files)

(defun my--build-tags (dir)
  "do build tags in one dir"
  (eshell-command-result
  ;; (message
   ;; (format "cd %s && fd \".*\\.lua|.*\\.c|.*\\.h|.*\\.cc\" | etags -" dir ))
   (format "cd %s && fd \".*\\.lua\\$|.*\\.c\\$|.*\\.h\\$|.*\\.cc\\$|.*\\.js\\$|.*\\.ts\\$|.*\\.go\\$|.*\\.vue\\$|.*\\.erl\\$|.*\\.hrl\\$\" | etags -" dir ))
  )

;; (defun my--build-tags-test ()
;;   "do build tags in one dir"
;;   (interactive)
;;   (message
;;   (eshell-command-result
;;    (format "cd %s && fd \".*\\.h\\$\"" (dominating-file ".git"))))
;;   )

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
	 dir
	 (file-exists-p (concat dir "TAGS"))
	 (my--build-tags dir)
	 )
	)
  )

(defun my-refresh-svn-git ()
  ""
  (interactive)
  (let ((git (dominating-file ".git"))
		(svn (dominating-file ".svn"))
		)
	(and git svn
		 (shell-command-to-string
		  (format "cd %s && svn up " git)
		  )
		 (shell-command-to-string (format "cd %s && git commit -a -m \"trunk\"" git))
		 )
	)
  )

(provide 'init-misc)
