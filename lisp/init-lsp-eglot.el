(use-package eglot
  :hook (prog-mode . (lambda ()
		       (unless (ignore-lsp-mode-p)
		         (eglot-ensure)
			 )
		       ))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  )
   

(provide 'init-lsp-eglot)
