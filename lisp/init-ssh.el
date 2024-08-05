
;; https://github.com/magit/magit/wiki/Pushing-with-Magit-from-Windows
(use-package ssh-agency
  :if *is-windows*
  :defer 2
  ;;:demand t
  ;;:after (magit)
  )


(provide 'init-ssh)
;;; init-ssh.el ends here
