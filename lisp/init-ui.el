;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package emacs
  :config
  (setq inhibit-splash-screen t)  ;; 关闭欢迎界面
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  (tool-bar-mode -1)    ;; 关闭工具栏
  (menu-bar-mode -1)    ;; 关闭菜单栏
  (if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))    ;; 关闭文件滑动控件
  ;; 高亮当前行
  (global-hl-line-mode t)
  ;; 最大化
  ;; https://www.emacswiki.org/emacs/FullScreen
  (if *is-windows* (toggle-frame-maximized))
  ;;光标
  (setq-default cursor-type 'box)
  )

;;(use-package gruvbox-theme
;;  :init (load-theme 'gruvbox-dark-soft t))
;; (use-package doom-themes
;;   :init
;;   (load-theme 'doom-molokai t)
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   ;;(load-theme 'doom-one t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
  
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;   (doom-themes-treemacs-config)
  
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

(use-package monokai-theme
;;  :init
  ;;  (load-theme 'monokai t)
  ;;:defer nil
  :config
  (setq ;; foreground and background
      monokai-foreground     "#ABB2BF"
      monokai-background     "#282C34"
      ;; highlights and comments
      monokai-comments       "#F8F8F0"
      monokai-emphasis       "#282C34"
      monokai-highlight      "#FFB269"
      monokai-highlight-alt  "#66D9EF"
      monokai-highlight-line "#1B1D1E"
      monokai-line-number    "#F8F8F0"
      ;; colours
      monokai-blue           "#61AFEF"
      monokai-cyan           "#56B6C2"
      monokai-green          "#98C379"
      monokai-gray           "#3E4451"
      monokai-violet         "#C678DD"
      monokai-red            "#E06C75"
      monokai-orange         "#D19A66"
      monokai-yellow         "#E5C07B")
  (setq monokai-height-minus-1 0.8
      monokai-height-plus-1 1.1
      monokai-height-plus-2 1.15
      monokai-height-plus-3 1.2
      monokai-height-plus-4 1.3)
  ;;(load-theme 'monokai t)
  )

(use-package challenger-deep-theme)
(use-package srcery-theme
  :init
  (load-theme 'srcery t)
  )

;;(use-package smart-mode-line
;;    :init
;;    (setq sml/no-confirm-load-theme t)
;;    (setq sml/theme 'respectful)
;;    (sml/setup))


(use-package popwin
  :init
  (popwin-mode t)
  )

;; 彩虹猫。。。
(use-package nyan-mode
  :init
  (nyan-mode)
  (nyan-start-animation)
  )

(provide 'init-ui)
;;; init-ui.el ends here
