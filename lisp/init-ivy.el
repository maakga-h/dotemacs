
(use-package ivy
  :bind (
	 ("\C-s" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 
	 ("C-c g" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 ("C-c k" . counsel-ag)      
	 
	 ("<f1> f" . counsel-describe-function)
	 ("<f1> v" . counsel-describe-variable)
	 ("<f1> l" . counsel-find-library)
	 
	 ("\C-h \C-f" . find-function)
	 ("\C-h \C-v" . find-variable)
	 ("\C-h \C-k" . find-function-on-key)
	 )
  :config
  (progn
    (ivy-mode t)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)    
   )
  )

(provide 'init-ivy)
