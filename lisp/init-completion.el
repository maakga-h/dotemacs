
(use-package company 
  :config 
  (setq company-dabbrev-code-everywhere t 
        company-dabbrev-code-modes t 
        company-dabbrev-code-other-buffers 'all 
        company-dabbrev-downcase nil 
        company-dabbrev-ignore-case t 
        company-dabbrev-other-buffers 'all 
        company-require-match nil 
        company-minimum-prefix-length 2 
        company-show-numbers t 
        company-tooltip-limit 20 
        company-idle-delay 0 
        company-echo-delay 0 
        company-tooltip-offset-display 'scrollbar 
        company-begin-commands '(self-insert-command)) 
  (push '(company-semantic :with company-yasnippet) company-backends) 
  :hook ((after-init . global-company-mode)))

(use-package ivy 
  :defer 1 
  :demand
  :delight
  :hook (after-init . ivy-mode) 
  :config 
  (ivy-mode 1) 
  (setq ivy-use-virtual-buffers t 
        ivy-initial-inputs-alist nil 
        ivy-count-format "%d/%d " 
        enable-recursive-minibuffers t 
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))
	)
  )
;;  (ivy-posframe-mode 1))) 

(use-package counsel 
  :after (ivy)
  :config
  (defun my/counsel-rg-with-ivy-thing-at-point ()
  "`counsel-rg' with `ivy-thing-at-point'."
  (interactive)
  (let ((thing (ivy-thing-at-point)))
    (when (use-region-p)
      (deactivate-mark))
    (counsel-rg (regexp-quote thing))))

  (defun ivy-with-thing-at-point (cmd)
      (let ((ivy-initial-inputs-alist
             (list
              (cons cmd (thing-at-point 'symbol)))))
        (funcall cmd)))
   ;; Example 1
    (defun counsel-ag-thing-at-point ()
      (interactive)
      (ivy-with-thing-at-point 'counsel-rg))
  
  :bind (("M-x" . counsel-M-x) 
         ("C-x C-f" . counsel-find-file) 
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)
         ("C-r" . counsel-rg)
         ("C-q" . my/counsel-rg-with-ivy-thing-at-point)

         ("C-q" . counsel-ag-thing-at-point)
	     ("M-y" . counsel-yank-pop)
         ("C-x r b" . counsel-bookmark)
	 )
  )

(use-package swiper 
  :after ivy 
  :bind (("C-s" . swiper)
         ;;("C-r" . swiper-isearch-backward)
         )
  :config (setq swiper-action-recenter t 
                swiper-include-line-number-in-search t))

(use-package dumb-jump)

(provide 'init-completion)
