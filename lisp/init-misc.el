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

(provide 'init-misc)
