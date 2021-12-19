;;; code:
(defun ignore-lsp-mode-p ()
  "is mode ignore lsp mode"
  (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'lua-mode 'sh-mode 'makefile-gmake-mode)
  )

(if (boundp 'my/lsp)
    (pcase my/lsp
      ('lsp-mode (require 'init-lsp-lsp-mode))
      ('eglot (require 'init-lsp-eglot))
      )    
  )

(provide 'init-lsp)
