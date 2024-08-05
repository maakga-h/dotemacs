(require 'org-tempo)
(setq org-src-fontify-natively t)

(unless (version< emacs-version "28")
  (use-package org-gtd)
  )

(provide 'init-org)
