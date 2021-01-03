(use-package youdao-dictionary
  :bind (("C-c y" . youdao-dictionary-search-at-point))
  :config
  (setq url-automatic-caching t)
  ;;(push "*Youdao Dictionary*" popwin:special-display-config)
  
  )

(provide 'init-utils)
