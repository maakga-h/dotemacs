 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa-cn" . "http://elpa.emacs-china.org/melpa/"))))


(require 'cl)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


 ;; Add Packages
(defvar my/packages '(
		      general
		      use-package
		      which-key
		      youdao-dictionary
		      helpful
		      ;;smex
		      ivy
		      swiper
		      counsel
		      ;; --- version-control
		      magit
		;; --- Auto-completion ---
	              company
		;; --- Better Editor ---
		      hungry-delete
		      window-numbering
		      smartparens
		      popwin
		      lsp-mode
		;; swiper
		;; counsel
		;; smartparens
		;; --- Major Mode ---
		;; js2-mode
		;; --- Minor Mode ---
		;; nodejs-repl
		;; exec-path-from-shell
		;; --- Themes ---
		      monokai-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))


(require 'init-company)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-theme)
(require 'init-window-numbering)
(require 'init-ivy)
(require 'init-org)
(require 'init-magit)
(require 'smartparens-config)
(smartparens-global-mode t)
(require 'init-popwin)
(require 'init-lsp)
(require 'init-erlang-ls)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(package-selected-packages
   (quote
    (lsp-origami lsp-ui company-lsp yasnippet erlang use-package which-key youdao-dictionary helpful ivy swiper counsel magit company hungry-delete window-numbering smartparens popwin lsp-mode monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
