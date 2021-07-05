(use-package youdao-dictionary
  :bind (("C-c y" . youdao-dictionary-search-at-point))
  :config
  (setq url-automatic-caching t)
  ;;(push "*Youdao Dictionary*" popwin:special-display-config)  
  )

(if (not *is-windows*)
	(use-package tldr)
  )

(use-package keyfreq
  :init
  (keyfreq-mode t)
  (keyfreq-autosave-mode t)
  :config
  (setq keyfreq-excluded-commands
	'(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line)
	)
  )

(use-package undo-tree)

(use-package visual-fill-column
  ;;:hook
  ;;(visual-fill-column-mode. visual-line-mode)
  )

(use-package nov
  :hook
  (nov-mode . (lambda () (display-line-numbers-mode -1)))
  (nov-mode . visual-line-mode)
  (nov-mode . visual-fill-column-mode)  
  :config
  (setq nov-text-width t)
  ;;  (setq visual-fill-column-center-text t)
  :mode ("\\.epub\\'" . nov-mode)
  )
;;(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;;(require 'justify-kp)
(defun my-nov-window-configuration-change-hook ()
  (my-nov-post-html-render-hook)
  (remove-hook 'window-configuration-change-hook
               'my-nov-window-configuration-change-hook
               t))

(defun my-nov-post-html-render-hook ()
  (if (get-buffer-window)
      (let ((max-width (pj-line-width))
            buffer-read-only)
        (save-excursion
          (goto-char (point-min))
          (while (not (eobp))
            (when (not (looking-at "^[[:space:]]*$"))
              (goto-char (line-end-position))
              (when (> (shr-pixel-column) max-width)
                (goto-char (line-beginning-position))
                (pj-justify)))
            (forward-line 1))))
    (add-hook 'window-configuration-change-hook
              'my-nov-window-configuration-change-hook
              nil t)))

(add-hook 'nov-post-html-render-hook 'my-nov-post-html-render-hook)

(provide 'init-utils)
