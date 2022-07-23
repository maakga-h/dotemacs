(use-package sis
  :defer 1
  :config
  (if *is-emacs-27*
	  (sis-ism-lazyman-config "1033" "2052" 'im-select)
	  )
  ;; (sis-ism-lazyman-config nil t 'w32)

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )

(provide 'init-input-method)
