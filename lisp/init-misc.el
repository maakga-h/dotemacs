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

(defun my-eshell-etags-c ()
  "depth = 1"
  (interactive)
  (eshell-command "fd -d=1 \".*.[ch]$\" | etags -")
  )


(defun my/fix-win-pathstr (str)
  "docstring"
  (let
	  ((path (replace-regexp-in-string "\\\\" "\/" str))
	   )
	(car (split-string path "\n" t))
	)
  )

(defun my-eshell-etags-lua ()
  ""
  (interactive)
  (eshell-command "find . -regex \".*\\.lua\\|.*\\.[ch]\" -print | etags -")
  )

(defun my-eshell-etags-erlang ()
  ""
  (interactive)
  (eshell-command "find . -regex \".*\\.erl\\|.*\\.hrl\" -print | etags -")
  )

(provide 'init-misc)
