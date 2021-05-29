
;; 高亮当前行
(use-package hl-line
  :hook ((after-init . global-hl-line-mode))
  )

;; TODO or try highlight-indent
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  :config
  ;; Don't display indentations in `swiper'
      ;; https://github.com/DarthFennec/highlight-indent-guides/issues/40
      (with-eval-after-load 'ivy
        (defun my-ivy-cleanup-indentation (str)
          "Clean up indentation highlighting in ivy minibuffer."
          (let ((pos 0)
                (next 0)
                (limit (length str))
                (prop 'highlight-indent-guides-prop))
            (while (and pos next)
              (setq next (text-property-not-all pos limit prop nil str))
              (when next
                (setq pos (text-property-any next limit prop nil str))
                (ignore-errors
                  (remove-text-properties next pos '(display nil face nil) str))))))
        (advice-add #'ivy-cleanup-string :after #'my-ivy-cleanup-indentation))
  )

(use-package diff-hl
  :hook (after-init . global-diff-hl-mode)
  )

(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :init
  (setq show-paren-when-point-inside-paren t)
  :custom
  (show-paren-when-point-in-periphery t)
  :config
  (with-no-warnings
    ;; Display matching line for off-screen paren.
    (defun display-line-overlay (pos str &optional face)
      "Display line at POS as STR with FACE.
FACE defaults to inheriting from default and highlight."
      (let ((ol (save-excursion
                  (goto-char pos)
                  (make-overlay (line-beginning-position)
                                (line-end-position)))))
        (overlay-put ol 'display str)
        (overlay-put ol 'face
                     (or face '(:inherit highlight)))
        ol))

    (defvar-local show-paren--off-screen-overlay nil)
    (defun show-paren-off-screen (&rest _args)
      "Display matching line for off-screen paren."
      (when (overlayp show-paren--off-screen-overlay)
        (delete-overlay show-paren--off-screen-overlay))
      ;; Check if it's appropriate to show match info,
      (when (and (overlay-buffer show-paren--overlay)
                 (not (or cursor-in-echo-area
                          executing-kbd-macro
                          noninteractive
                          (minibufferp)
                          this-command))
                 (and (not (bobp))
                      (memq (char-syntax (char-before)) '(?\) ?\$)))
                 (= 1 (logand 1 (- (point)
                                   (save-excursion
                                     (forward-char -1)
                                     (skip-syntax-backward "/\\")
                                     (point))))))
        ;; Rebind `minibuffer-message' called by `blink-matching-open'
        ;; to handle the overlay display.
        (cl-letf (((symbol-function #'minibuffer-message)
                   (lambda (msg &rest args)
                     (let ((msg (apply #'format-message msg args)))
                       (setq show-paren--off-screen-overlay
                             (display-line-overlay
                              (window-start) msg ))))))
          (blink-matching-open))))
    (advice-add #'show-paren-function :after #'show-paren-off-screen)
    ))

(use-package symbol-overlay
  :delight
  :hook (prog-mode . symbol-overlay-mode)
  :bind (:map symbol-overlay-mode
              ("M-i" . symbol-overlay-put)
              ("M-I" . symbol-overlay-remove-all)
              ("M-n" . symbol-overlay-jump-next)
              ("M-p" . symbol-overlay-jump-prev)
              )
  )

(use-package rainbow-mode
  :hook (elisp-mode . rainbow-mode)
  )

;; Highlight brackets according to their depth
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hl-todo
  ;;:hook (after-init . global-hl-todo-mode)
  :hook (prog-mode . hl-todo-mode)
  )

;; (use-package volatile-highlights
;;   :diminish
;;   :hook (after-init . volatile-highlights-mode)
;;   )

(provide 'init-highlight)
