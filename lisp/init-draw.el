(use-package plantuml-mode
  :config
  (setq plantuml-jar-path "d:/Scoop/apps/plantuml/1.2021.8/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  :mode
  ("\\.plantuml\\'" . plantuml-mode)
  )

(provide 'init-draw)
