
(defvar my/git-install-root
  (getenv "GIT_INSTALL_ROOT")
  "my git install root"
  )
;; unless
(when *is-windows*
  (customize-set-variable 'ediff-diff-program
						  (concat
						   (car (directory-files my/git-install-root 'FULL "usr"))
						   "/bin/diff.exe"
						   )
						  )

  )

(use-package ediff
  :config
  (customize-set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
  (customize-set-variable 'ediff-split-window-function 'split-window-horizontally)
  )

(provide 'init-diff)
;;; init-diff ends here
