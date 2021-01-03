
(setq load-path (cons  "/root/.asdf/installs/erlang/22.3/lib/tools-3.3.1/emacs" load-path))
(setq erlang-root-dir "/root/.asdf/installs/erlang/22.3")
(setq exec-path (cons "/root/.asdf/installs/erlang/22.3/bin" exec-path))
(require 'erlang-start)

(provide 'init-erlang)
