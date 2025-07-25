
(use-package emacs
  :config
  ;; (defalias 'yes-or-no-p 'y-or-n-p)
  (setopt use-short-answers t) ;; since emacs 29
  (setq inhibit-splash-screen t)  ;; 关闭欢迎界面

  (tool-bar-mode -1)    ;; 关闭工具栏
  (menu-bar-mode -1)    ;; 关闭菜单栏
  (if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))    ;; 关闭文件滑动控件
  ;; 最大化
  ;; https://www.emacswiki.org/emacs/FullScreen
  (if *is-windows* (toggle-frame-maximized))
  ;;光标
  (setq-default cursor-type 'bar)
  ;; (customize-set-variable 'tab-width 4)
  (setq-default tab-width 4)
;;  (customize-set-variable 'c-basic-offset tab-width)
  (defvaralias 'c-basic-offset 'tab-width)
  (defvaralias 'cperl-indent-level 'tab-width)
;;  (setq-default electric-indent-inhibit t)
;;  (setq-default indent-tabs-mode nil)
  ;;(customize-set-variable 'indent-tabs-mode nil)
  (setq auto-save-visited-interval 1)
  :hook
  (after-init . auto-save-visited-mode)
  (prog-mode . prettify-symbols-mode)
  :bind
  (("C-2" . set-mark-command) )
  )

;; (use-package no-littering
;;   :defer 1 
;;   :config
;;   (setq auto-save-file-name-transforms
;; 		`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
;;   (require 'recentf)
;;   (add-to-list 'recentf-exclude no-littering-var-directory)
;;   (add-to-list 'recentf-exclude no-littering-etc-directory)
;;   )

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
  :ensure nil
  :hook (after-init . global-so-long-mode)
  :config (setq so-long-threshold 400)
  )

(use-package popwin
  :init
  (popwin-mode t)
  )

(unless *is-tui*
;; 彩虹猫。。。
(use-package nyan-mode
  :hook
  (after-init . nyan-mode)
  :custom
  (nyan-wavy-trail t)
  (nyan-animate-nyancat t)
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
  :ensure nil
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
(when *is-windows*
  (set-frame-font "-outline-Consolas-normal-normal-normal-mono-17-*-*-*-c-*-iso10646-1")
  )
(set-face-attribute 'default nil :height 130)

;; Nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(use-package editorconfig
  :ensure t
  :defer nil
  :config
  (editorconfig-mode 1))

(use-package vlf)

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode)
  :custom
  (save-place-file (my/local-file "places"))
  (save-place-forget-unreadable-files nil)
  )

;; https://github.com/condy0919/emacs-newbie/blob/master/introduction-to-builtin-modes.md
(use-package whitespace
  :ensure nil
  :hook ((prog-mode markdown-mode conf-mode) . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing))
  )

;; 折叠代码 例如{}里面的内容
(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode)
  :config
  ;; 这里额外启用了 :box t 属性使得提示更加明显
  (defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))

  (defun hideshow-folded-overlay-fn (ov)
    (when (eq 'code (overlay-get ov 'hs))
      (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
             (info (format " ... #%d " nlines)))
        (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))

  (setq hs-set-up-overlay 'hideshow-folded-overlay-fn)
  )

;; ;; Enable rich annotations using the Marginalia package
;; (use-package marginalia
;;   ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
;;   ;; available in the *Completions* buffer, add it to the
;;   ;; `completion-list-mode-map'.
;;   :bind (:map minibuffer-local-map
;;          ("M-A" . marginalia-cycle))

;;   ;; The :init section is always executed.
;;   :init

;;   ;; Marginalia must be activated in the :init section of use-package such that
;;   ;; the mode gets enabled right away. Note that this forces loading the
;;   ;; package.
;;   (marginalia-mode))

(provide 'init-editor)
;;; init-editor.el ends here
