
;; -*- lisp -*-

;; This is a sample .emacs file which you can use to troubleshoot your
;; Erlang LS Emacs setup.

;; Use packages
(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)
;;(package-refresh-contents)

;; Define a utility function which either installs a package (if it is
;; missing) or requires it (if it already installed).
(defun package-require (pkg &optional require-name)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg))
  (if require-name
      (require require-name)
    (require pkg)))

;; Install the official Erlang mode
(package-require 'erlang)

;; Include the Language Server Protocol Clients
(package-require 'lsp-mode)

;; Enable LSP for Erlang files
(add-hook 'erlang-mode-hook #'lsp)

;; Require and enable the Yasnippet templating system
(package-require 'yasnippet)
(yas-global-mode t)

;; Enable logging for lsp-mode
(setq lsp-log-io t)

;; Enable code completion
(package-require 'company-lsp)
(push 'company-lsp company-backends)

;; Override the default erlang-compile-tag to use completion-at-point
(eval-after-load 'erlang
  '(define-key erlang-mode-map (kbd "C-M-i") #'company-lsp))

;; Show line and column numbers
(add-hook 'erlang-mode-hook 'linum-mode)
(add-hook 'erlang-mode-hook 'column-number-mode)

;; Enable and configure the LSP UI Package
(package-require 'lsp-ui)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-position 'bottom)

;; Enable LSP Origami Mode (for folding ranges)
(package-require 'lsp-origami)
(add-hook 'origami-mode-hook #'lsp-origami-mode)
(add-hook 'erlang-mode-hook #'origami-mode)

;; Provide commands to list workspace symbols:
;; - helm-lsp-workspace-symbol
;; - helm-lsp-global-workspace-symbol
;;(package-install 'helm-lsp)

;; Ensure your Emacs environment looks like your user's shell one
(package-require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(setq lsp-log-io t)

(provide 'init-erlang-ls)
