(use-package plantuml-mode
  :config
  (let*
      (
       (path (my-eshell-which-cmd-head "plantuml"))
       (txt (if path (eshell-command-result (concat "cat " path)) nil))
       (re "\"\\(.*\\)\"")
       (jarpath
        (unless (not path)
          (string-match re txt)
          (concat (string-join
                   (butlast (split-string (expand-file-name (match-string 1 txt)) "/"))
                   "/") "/plantuml.jar")
          )
        )
       )
    (if jarpath (setq plantuml-jar-path jarpath))
    )
  (setq plantuml-default-exec-mode 'jar)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  :mode
  ("\\.plantuml\\'" . plantuml-mode)
  )

;; (save-match-data
;;   (let ((mystr "The quick fox jumped quickly."))
;;     (string-match "\\(qu\\)\\(ick\\)" mystr)
;;     (match-string 1 mystr)
;;     )
;;   )

(provide 'init-draw)
