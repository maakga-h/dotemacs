
;;; Settings for package archives
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("gnu" . "http://elpa.emacs-china.org/gnu/")
                         ("org" . "http://elpa.emacs-china.org/org/")
			 ))

(require 'package)

;;; Initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  ;; (when (version< emacs-version "27.0")
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; Settings for use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure use-package prior to loading it
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-always-defer t
        use-package-always-demand nil
        use-package-expand-minimally t
        use-package-verbose t))
(setq load-prefer-newer t)

(eval-when-compile
  (require 'use-package))

(use-package gnu-elpa-keyring-update)
(use-package diminish)
(use-package delight)
(use-package dash)
(use-package dash-functional)

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

(use-package shiftless
  :defer 1
  :quelpa (shiftless :fetcher github :repo "DogLooksGood/shiftless.el")
  :config
  (setq shiftless-delay (if (boundp 'my/shiftless-delay) my/shiftless-delay 0.5))
  (setq shiftless-interval (if (boundp 'my/shiftless-interval) my/shiftless-interval 0.8))
  ;;(shiftless-mode t)
  )

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

(provide 'init-package)
