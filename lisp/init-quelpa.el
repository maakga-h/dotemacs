
(use-package quelpa
  ;; TODO must succ
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil) ;; 更新包时不更新自己
  (quelpa-update-melpa-p nil) ;; 加载quelpa时不更新melpa
  (quelpa-checkout-melpa-p nil)  ;; quelpa不检出melpa 只用在非melpa的包
  )

(use-package quelpa-use-package
  :demand
  :config
  (quelpa-use-package-activate-advice)
  :custom
  (quelpa-use-package-inhibit-loading-quelpa t)
  )

;; (use-package shiftless
;;   :defer 1
;;   :quelpa (shiftless :fetcher github :repo "DogLooksGood/shiftless.el")
;;   :config
;;   (setq shiftless-delay (if (boundp 'my/shiftless-delay) my/shiftless-delay 0.5))
;;   (setq shiftless-interval (if (boundp 'my/shiftless-interval) my/shiftless-interval 0.8))
;;   ;;(shiftless-mode t)
;;   )

(use-package justify-kp
  :quelpa (justify-kp :fetcher github :repo "Fuco1/justify-kp")
  )

;; ;;el-get
;; (add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))
;; (unless (require 'el-get nil 'noerror)
;;   ;; todo must succ
;;   (use-package el-get)
;;   )

;; (el-get-bundle Fuco1/justify-kp :features justify-kp)

;; (add-to-list 'el-get-recipe-path (expand-file-name "el-get-user/recipes" user-emacs-directory))

;; (el-get 'sync)

(provide 'init-quelpa)
