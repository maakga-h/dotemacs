
(use-package magit)

;; show blame
(use-package vc-msg
  :config
  (defun vc-msg-svn-generate-cmd@around (orig opts)
	"Generate Subversion CLI from OPTS."
	(format "%s %s" vc-msg-svn-program opts)
	)
  (advice-add 'vc-msg-svn-generate-cmd :around #'vc-msg-svn-generate-cmd@around)
  )

;; (use-package git-messenger)

(provide 'init-vcs)
