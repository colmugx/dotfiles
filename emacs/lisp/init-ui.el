;; titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)

;; scrollbar
(scroll-bar-mode -1)

;; toolbar
(tool-bar-mode -1)

;; fullscreen
(toggle-frame-maximized)

;; number
(use-package linum-relative
  :ensure t
  :config
  (global-linum-mode)
  (linum-relative-mode))

;; theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; font
(set-face-attribute 'default nil :font "Fira Code 14")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
    charset
	  (font-spec :family "PingFang SC" :size 14)))



(provide 'init-ui)
