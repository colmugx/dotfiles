(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)

;; 折行
(global-visual-line-mode 1)

;; tab 空格
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; treemacs 文件树
(use-package treemacs
  :defer t
  :config
  (setq treemacs–icon-size 14)
  (setq treemacs-width 30))

(use-package treemacs-evil
  :after treemacs evil)

(use-package treemacs-projectile
  :after treemacs projectile)

;; dashboard 启动面板
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5))))

(use-package epa-file
  :ensure nil
  :init
  (add-hook 'kill-emacs-hook (defun personal--kill-gpg-agent ()
    (shell-command "pkill gpg-agent")))
  :config
  (epa-file-enable)
  (setq epa-pinentry-mode 'loopback)
  (setq epa-file-cache-passphrase-for-symmetric-encryption t))

(provide 'init-basic)
