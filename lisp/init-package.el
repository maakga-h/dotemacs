
;;; Settings for package archives
;; (setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
;;                          ("gnu" . "http://elpa.emacs-china.org/gnu/")
;;                          ("org" . "http://elpa.emacs-china.org/org/")
;; 			 ))

;; (setq package-archives '(("melpa-cn" . "http://1.15.88.122/melpa/")
;;                          ("gnu-cn"   . "http://1.15.88.122/gnu/")
;;                          ("org-cn"   . "http://1.15.88.122/org/")
;;                          ))

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;;(add-to-list 'package-archives
;;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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

(when (display-graphic-p)
  ;;(require 'init-quelpa)
  )

(provide 'init-package)
