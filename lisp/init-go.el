(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'project-find-functions #'project-find-go-module)
  )

(use-package go-gen-test)
(use-package gotest)

(provide 'init-go)
