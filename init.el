;;; package --- Summary
;;; Commentary:
;;; Code:

(when (version< emacs-version "29")
  (error "This requires Emacs 29 and above!"))

(setq load-lisp-dir (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path load-lisp-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))

(defconst *local-dir*
  (locate-user-emacs-file ".local")
  "my local dir")

(make-directory *local-dir* :parents)

(defun my/local-file (file)
  "make local file name"
  (expand-file-name file *local-dir*)
  )

(require 'init-consts)
(require 'init-gc)
(require 'init-package)
(require 'init-misc)
(require 'init-eglot)
(require 'init-lang)
(require 'init-ssh)
(require 'init-vim)
(require 'init-sicp)
(require 'init-erlang)
(require 'init-go)
(require 'init-typescript)
(require 'init-win)
(require 'init-keybinds)
(require 'init-vcs)
(require 'init-completion)
(require 'init-editor)
(require 'init-checker)
;; (require 'init-lsp)
;; (require 'init-leetcode)
(require 'init-org)
;; (require 'init-help)
(require 'init-lua)
(require 'init-theme)
(require 'init-yasnippet)
(require 'init-search-tools)
(require 'init-utils)
(require 'init-highlight)
(require 'init-draw)
(require 'init-systemtap)
(require 'init-input-method)
(require 'init-web)
(require 'init-markdown)
(require 'init-diff)
;; (require 'init-pyim)
;;; init.el ends here
