;;; package --- Summary
;;; Commentary:

;;; Code:

(defcustom my/erlang-root-dir nil
  "Erlang install dir.")

(defcustom my/erlang-tools-path nil
  "")

(defcustom my/erlang-exec-path nil
  "")

(when my/erlang-root-dir
  (setq load-path (cons my/erlang-tools-path load-path))
  (setq erlang-root-dir my/erlang-root-dir)
  (setq exec-path (cons my/erlang-exec-path exec-path))
  (require 'erlang-start)
  )

 ;; (if (boundp 'my/erlang-root-dir)
 ;;     (require 'erlang-start)
 ;;   )

(provide 'init-erlang)
;;; init-erlang ends here
