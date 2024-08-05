(use-package pyim-basedict)
(use-package pyim
  :defer 1 
  :config
  (require 'pyim-cregexp-utils)
  (pyim-basedict-enable)
  (setq default-input-method "pyim")

  ;; 显示5个候选词。
  (setq pyim-page-length 5)

  ;; 我使用全拼
  (pyim-default-scheme 'quanpin)
  ;; (pyim-default-scheme 'wubi)
  ;; (pyim-default-scheme 'cangjie)

  ;; 开启代码搜索中文功能（比如拼音，五笔码等）
  ;; (pyim-isearch-mode 1)
  )

(provide 'init-pyim)
