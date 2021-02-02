(use-package youdao-dictionary
  :bind (("C-c y" . youdao-dictionary-search-at-point))
  :config
  (setq url-automatic-caching t)
  ;;(push "*Youdao Dictionary*" popwin:special-display-config)  
  )


(use-package tldr)

(use-package keyfreq
  :init
  (keyfreq-mode t)
  (keyfreq-autosave-mode t)
  :config
  (setq keyfreq-excluded-commands
	'(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line)
	)
  )

(use-package undo-tree)

(use-package visual-fill-column
  ;;:hook
  ;;(visual-fill-column-mode. visual-line-mode)
  )

(use-package nov
  :hook
  (nov-mode . (lambda () (display-line-numbers-mode -1)))
  (nov-mode . visual-line-mode)
  (nov-mode . visual-fill-column-mode)  
  :config
  (setq nov-text-width t)
;;  (setq visual-fill-column-center-text t)
  )
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(provide 'init-utils)
