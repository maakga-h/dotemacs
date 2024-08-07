;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 ;;(erlang-mode . lsp-deferred)
	 (prog-mode . (lambda()
			(unless (ignore-lsp-mode-p)
			  (lsp-deferred)
			  )
			)
		    )
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
    :commands (lsp lsp-deferred)
    :config
    (setq read-process-output-max (* 1024 1024)) ;; 1mb
    )

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))

(provide 'init-lsp-lsp-mode)
