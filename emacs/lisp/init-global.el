;; which-key 空格提示
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;; treemacs 文件树
(use-package treemacs
  :ensure t
  :after evil-leader
  :config
  (setq treemacs-width 30)
  (evil-leader/set-key "f t" 'treemacs))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; dashboard 启动面板
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5))))

(provide 'init-global)
