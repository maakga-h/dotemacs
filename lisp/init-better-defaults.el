
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(setq inhibit-splash-screen t)
(require 'recentf)
(recentf-mode t)
(if (> (length recentf-list) 0)
    (recentf-open-files)
  )

(global-auto-revert-mode t)
(global-display-line-numbers-mode t)

(defun open-my-init-file ()
  "quick open init file."
  (interactive)
    (find-file user-init-file)
;;  (find-file (concat user-emacs-directory "init.el") )
;;    (find-file "~/.emacs.d/init.el")
  )

;;(global-set-key "\M-?" help-command)
(global-set-key (kbd "<f2>") 'open-my-init-file)

					;(defadvice switch-to-buffer
;    (before existing-buffer activate compile)
;  "When interactive, switch to existing buffers only. "
;  (interactive "b")
;  )

(provide 'init-better-defaults)
