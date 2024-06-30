;; (use-package leetcode)

(use-package leetcode
  :quelpa (leetcode :fetcher github :repo "liyan-ah/leetcode-cn.el")
  :config
  (setq leetcode-prefer-language cpp)
  )

(provide 'init-leetcode)
