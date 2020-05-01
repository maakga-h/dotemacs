

(use-package org
  :init
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-time-grid
	(quote (
		(daily today require-timed)
                (300
                 600
                 900
                 1200
                 1500
                 1800
                 2100
                 2400)
                "......"
                "-----------------------------------------------------"
                )
	       )
	)
  (setq org-agenda-include-diary t)
  
  :bind (
	 ("C-c a" . 'org-agenda)
	 )
  :config
  (progn
    (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)) )    
    )
  )

;;integrated with Calendar
(general-advice-add 'org-agenda :after
                    (lambda (_)
                      (when (equal (buffer-name)
                                   "*Org Agenda*")
                        (calendar)
                        (calendar-mark-holidays)
                        (other-window 1))))

(general-advice-add 'org-agenda-quit :before
                    (lambda ()
                      (let ((window (get-buffer-window calendar-buffer)))
                        (when (and window (not (one-window-p window)))
                          (delete-window window)))))

(provide 'init-org)
