(if (boundp 'my/lsp)
    (pcase my/lsp
      ('lsp-mode (require 'init-lsp-lsp-mode))
      ('eglot (require 'init-lsp-eglot))
      )    
  )

(provide 'init-lsp)
