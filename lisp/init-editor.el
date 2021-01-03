
(use-package emacs
  :config
  (defalias 'yes-or-no-p 'y-or-n-p)  
  (require 'recentf)
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

(provide 'init-editor)
