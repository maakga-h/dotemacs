;;; package --- Summary
;;; Commentary:

;;; Code:

(defvar erlang-root-dir nil
  "Erlang install dir.")

(defvar erlang-tools-path nil
  "")

(defvar erlang-exec-path nil
  "")

 ;; (let (
 ;; 	  (erl-home (getenv "ERLANG_HOME"))
 ;; 	  )
 ;;   (unless (not erl-home)
 ;; 	(setq load-path (cons (concat (replace-regexp-in-string "\\\\" "\/" erl-home) "/lib/tools-3.5.2/emacs") load-path))
 ;; 	(setq erlang-root-dir (replace-regexp-in-string "\\\\" "\/" erl-home))
 ;; 	(setq exec-path (cons (concat (replace-regexp-in-string "\\\\" "\/" erl-home) "/bin") exec-path))
 ;; 	)
;;   )

(when (getenv "ERLANG_TOOLS_PATH")
  (setq erlang-root-dir (my/fix-win-pathstr (getenv "ERLANG_HOME")))
  (setq erlang-tools-path (my/fix-win-pathstr (getenv "ERLANG_TOOLS_PATH")))
  (setq erlang-exec-path (my/fix-win-pathstr (getenv "ERLANG_EXEC_PATH")))
  (setq load-path (cons erlang-tools-path load-path))
  (setq exec-path (cons erlang-exec-path exec-path))
  )

(unless erlang-tools-path

(let
	((erl-home (getenv "ERLANG_HOME"))
	 tools-path
	 bin-path
	 (fd-tool "fd -t d -p -d 3 'lib\\\\tools.*\\\\emacs' ")
	 (fd-bin "fd -t d -p -d 1 'bin' ")
	 foo
	 )
 (when erl-home
	(setq erlang-root-dir (my/fix-win-pathstr erl-home))
	(setq foo
		  (lambda (pattern)
			(my/fix-win-pathstr (eshell-command-result (concat pattern erlang-root-dir)))
			)
		  )
	(setq tools-path (funcall foo fd-tool))
	(setq bin-path (funcall foo fd-bin))
	(setq load-path (cons tools-path load-path))
	(setq exec-path (cons bin-path exec-path))

	)
 )
)

(when erlang-root-dir
  	(require 'erlang-start)
  )

 ;; (if (boundp 'erlang-root-dir)
 ;;     (require 'erlang-start)
 ;;   )

(provide 'init-erlang)
;;; init-erlang ends here
