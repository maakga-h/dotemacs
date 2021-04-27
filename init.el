(setq load-lisp-dir (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path load-lisp-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))

(require 'init-consts)
(require 'init-gc)
(require 'init-package)
(require 'init-lisp) ;; 这个前一点 配置括号容易看漏
(require 'init-erlang)
(require 'init-go)
(require 'init-win)
(require 'init-keybinds)
(require 'init-ui)
(require 'init-vcs)
(require 'init-completion)
(require 'init-editor)
(require 'init-checker)
(require 'init-misc)
(require 'init-lsp)
(require 'init-leetcode)
(require 'init-org)
(require 'init-help)
(require 'init-lua)
(require 'init-utils)

