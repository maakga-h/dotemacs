(use-package eglot
  :hook (prog-mode . (lambda ()
		       (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode)
		         (eglot-ensure)
			 )
		   ))
   )

(provide 'init-lsp-eglot)
