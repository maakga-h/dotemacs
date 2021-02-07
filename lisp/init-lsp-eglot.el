(use-package eglot
  :hook (prog-mode . (lambda ()
		       (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode)
		         (eglot-ensure)
			 )
		       ))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  )
   

(provide 'init-lsp-eglot)
