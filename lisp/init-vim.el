
;;;
(use-package evil
  :defer 1 
  :hook (after-init . evil-mode)
  :config
  ;;(evil-set-leader 'normal (kbd "SPC"))
  ;;(evil-define-key 'normal 'global (kbd "<leader>r") 'counsel-rg)
  ;;(evil-define-key 'normal 'global (kbd "<leader>q") 'counsel-ag-thing-at-point)
  ;;:custom
  ;;(evil-search-module 'isearch)
 ;; esc quits
  (defun minibuffer-keyboard-quit ()
	"Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
	(interactive)
	(if (and delete-selection-mode transient-mark-mode mark-active)
		(setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
  ;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
  ;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
  ;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  ;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  ;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  ;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  ;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  ;; (global-set-key [escape] 'evil-exit-emacs-state)
  )

(use-package general
  :defer 1
  :config
  (general-define-key 
   :states '(normal)
   :keymaps 'override
   :prefix "SPC"

   "SPC" 'execute-extended-command
   ;;
   "a" 'avy-goto-char-timer
   ;;
   "b" '(:wk "buff")
   "bb" 'ivy-switch-buffer
   "b/" 'switch-to-buffer-other-window
   "bk" 'kill-buffer
   ;;
   "c" '(:wk "comment")
   "cc" 'comment-line
   ;;
   "f" '(:wk "file")
   "ff" 'counsel-find-file
   "fF" 'find-file-other-window
   "fr" 'counsel-recentf
   ;;
   "g" '(:wk "git")
   "gf" 'counsel-git
   ;; help
   "h" '(:wk "help")
   "ha" 'apropos-command
   "hf" 'describe-function
   "hk" 'describe-key
   "hv" 'describe-variable
   ;;
   "p" '(:wk "project")
   "pf" 'find-file-in-project
   ;;
   "q" 'counsel-ag-thing-at-point
   ;;
   "r" 'counsel-rg
   ;;
   "s" 'swiper
   ;;
   "/" 'split-window-horizontally
   )

  )

(provide 'init-vim)
