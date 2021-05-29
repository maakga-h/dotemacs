;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package emacs
  :config
  (setq inhibit-splash-screen t)  ;; 关闭欢迎界面

  (tool-bar-mode -1)    ;; 关闭工具栏
  (menu-bar-mode -1)    ;; 关闭菜单栏
  (if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))    ;; 关闭文件滑动控件
  ;; 最大化
  ;; https://www.emacswiki.org/emacs/FullScreen
  (if *is-windows* (toggle-frame-maximized))
  ;;光标
  (setq-default cursor-type 'bar)
  )



(provide 'init-ui)
;;; init-ui.el ends here
