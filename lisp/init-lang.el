
;; http://ergoemacs.org/emacs/emacs_encoding_decoding_faq.html
(set-language-environment "UTF-8")
;; ;;;windows system
;; ;;fuck notify you for settning https://github.com/sriramkswamy/ryo-emacs/blob/master/init.el
;; (setq coding-system-for-read 'utf-8)										  	; use utf-8 by default for reading
 (setq coding-system-for-write 'utf-8-unix) ;; 保存文件用utf8
;; (set-language-environment 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (setq-default pathname-coding-system 'utf-8)
;; (setq default-process-coding-system
;;             '(utf-8 . utf-8))
;; (set-buffer-file-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; ;(set-clipboard-coding-system 'utf-8)

;; 读文件自动转码
(use-package unicad
  :init (unicad-mode)
  )

(provide 'init-lang)
;;; init-lang.el ends here
