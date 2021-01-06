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

(provide 'init-utils)
