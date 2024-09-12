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
  :config
  (global-linum-mode)
  (linum-relative-mode))

;; theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (my-leader-def
    :states '(normal emacs)
    "t s" 'load-theme))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 1)
  (doom-modeline-minor-modes t)
  (doom-modeline-indent-info t)
  (doom-modeline-unicode-fallback t)
  (doom-modeline-percent-position t)
  :hook (after-init . doom-modeline-mode)
  :config
  (setq display-time-default-load-average nil)
  (setq display-time-24hr-format t)
  (setq display-time-day-and-date t)
  (display-time))


(use-package all-the-icons)

;; font
(set-face-attribute 'default nil :font "Maple Mono 14")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
    charset
	  (font-spec :family "Lantinghei SC" :size 14)))


(provide 'init-ui)
