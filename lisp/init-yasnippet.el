(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

;; (append
;;  yas-snippet-dirs
;;  (mapcar
;;  (lambda (fullname) (expand-file-name "snippets" fullname))
;;  (directory-files package-user-dir t "yasnippet-snippets-.*" nil)
;;  )
;;  )

;; (mapcar
;;  (lambda (fullname) (expand-file-name "snippets" fullname))
;;  (directory-files package-user-dir t "yasnippet-snippets-.*" nil)
;;  )

;;(setq yas-snippet-dirs (yas-snippet-dirs))
 
(provide 'init-yasnippet)
