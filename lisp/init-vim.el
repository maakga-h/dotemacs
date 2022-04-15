
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
  )

(use-package general)

(general-define-key
 :states '(normal)
 :keymaps 'override
 :prefix "SPC"

 "SPC" 'execute-extended-command
 "q" 'counsel-ag-thing-at-point
 "r" 'counsel-rg

 "ff" 'counsel-find-file
 "fF" 'find-file-other-window
 "fr" 'counsel-recentf

 "gf" 'counsel-git

 "bb" 'ivy-switch-buffer
 "b/" 'switch-to-buffer-other-window
 "bk" 'kill-buffer

 "/" 'split-window-horizontally
 )

(provide 'init-vim)
