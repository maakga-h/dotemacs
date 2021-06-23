
(use-package emacs
  :config
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq inhibit-splash-screen t)  ;; 关闭欢迎界面

  (tool-bar-mode -1)    ;; 关闭工具栏
  (menu-bar-mode -1)    ;; 关闭菜单栏
  (if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))    ;; 关闭文件滑动控件
  ;; 最大化
  ;; https://www.emacswiki.org/emacs/FullScreen
  (if *is-windows* (toggle-frame-maximized))
  ;;光标
  (setq-default cursor-type 'bar)
  (customize-set-variable 'tab-width 4)
  ;;(customize-set-variable 'indent-tabs-mode nil)
  :bind
  (("C-2" . set-mark-command) )
  )

(use-package recentf
  :init
  (recentf-mode t)
  (if (> (length recentf-list) 0)
      (recentf-open-files)
    )
  )

;; Settings for C-a behavior
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ;;("C-c ^" . crux-top-join-line)
	 ("C-c ," . crux-find-user-init-file)
	 ;;("C-c C-," . crux-find-user-init-file) ;; 应该是shell中C-,不能用
         ("C-c C-d" . crux-duplicate-current-line-or-region)
         ("S-k" . crux-smart-kill-line)
	 )
  )

(use-package display-line-numbers
  :init
  (global-display-line-numbers-mode t)
  (setq display-line-numbers-type 'relative)
  )

(use-package so-long
    :hook (after-init . global-so-long-mode)
    :config (setq so-long-threshold 400))

(use-package popwin
  :init
  (popwin-mode t)
  )

(if (display-graphic-p)
;; 彩虹猫。。。
(use-package nyan-mode
  :defer 2
  :config
  (nyan-mode)
  (nyan-start-animation)
  )
)

(use-package ivy-posframe
  :after (ivy)
  :config
  (ivy-posframe-mode t)
  (setq ivy-posframe-display-functions-alist
    '((swiper . ivy-posframe-display-at-frame-center)
      (complete-symbol . ivy-posframe-display-at-point)
      (counsel-M-x . ivy-posframe-display-at-frame-center)
      (counsel-find-file . ivy-posframe-display-at-frame-center)
      (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
      (t . ivy-posframe-display-at-frame-center))
    )
  )

;; Settings for which-key - suggest next key
(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package window-numbering
  :init
  (window-numbering-mode t)
  (custom-set-faces '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold)))))
  )

(use-package hungry-delete
  :hook (prog-mode . hungry-delete-mode)
  :config
  ;;(global-hungry-delete-mode)
  (setq hungry-delete-join-reluctantly t)
  )

;; 阅读源码是不给编辑
;; todo 
;; https://www.emacswiki.org/emacs/DirectoryVariables
;; https://emacs.stackexchange.com/questions/3676/how-to-enter-view-only-mode-when-browsing-emacs-source-code-from-help
;; (dir-locals-set-class-variables
;;  'emacs-src
;;  '((nil . ((buffer-read-only . t)
;;            ;;(show-trailing-whitespace . nil)
;;            ;;(tab-width . 8)
;;            ;;(eval . (whitespace-mode -1))
;; 	   )
;; 	)
;;    )
;;  )
;; (dir-locals-set-directory-class "/opt/emacs/share/emacs" 'emacs-src)
;; (dir-locals-set-directory-class package-user-dir 'emacs-src)
;; (dir-locals-set-directory-class source-directory 'emacs-src)
;;(dir-locals-set-directory-class find-function-C-source-directory 'emacs-src)

(use-package autorevert
  :hook (after-init . global-auto-revert-mode)
  )


(use-package avy
  :bind (("C-;" . avy-goto-char-timer)
         ("M-g M-g" . avy-goto-line)
         )
  )

(use-package browse-kill-ring
  :bind (:map browse-kill-ring-mode-map
              ("C-g" . browse-kill-ring-quit)
              ("M-n" . browse-kill-ring-forward)
              ("M-p" . browse-kill-ring-previous)
              )
  )
;; (with-eval-after-load 'browse-kill-ring
;;   (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
;;   (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
;;   (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous))

(use-package pretty-mode)

;;(set-frame-font '-outline-Consolas-bold-normal-normal-mono-17-*-*-*-c-*-fontset-auto2)
(set-frame-font "-outline-Consolas-bold-normal-normal-mono-17-*-*-*-c-*-iso10646-1")
(set-face-attribute 'default nil :height 130)

;; Nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-editor)
;;; init-editor.el ends here
