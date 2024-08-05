;;; package --- Summary
;;; Commentary:

;;; Code:

(defcustom my/erlang-root-dir nil
  "Erlang install dir.")

(defcustom my/erlang-tools-path nil
  "")

(defcustom my/erlang-exec-path nil
  "")

(unless my/erlang-root-dir
  (customize-set-variable 'my/erlang-root-dir (getenv "ERLANG_HOME"))
  )

(when my/erlang-root-dir
  (customize-set-variable 'my/erlang-exec-path
						  (car (directory-files my/erlang-root-dir 'FULL "bin"))
						  )
  (customize-set-variable 'my/erlang-tools-path
						  (car (file-expand-wildcards (expand-file-name "lib/tools-*/emacs" my/erlang-root-dir) 'FULL))
						  )
  )

(when (and my/erlang-root-dir
		   my/erlang-exec-path
		   my/erlang-tools-path)
  (setq load-path (cons my/erlang-tools-path load-path))
  (setq erlang-root-dir my/erlang-root-dir)
  (setq exec-path (cons my/erlang-exec-path exec-path))
  (require 'erlang-start)
  (add-to-list 'auto-mode-alist '("\\rebar.config\\'" . erlang-mode))
  )

(provide 'init-erlang)
;;; init-erlang ends here
