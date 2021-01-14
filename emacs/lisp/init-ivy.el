(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

(use-package ivy-posframe
  :after ivy
  :diminish ivy-posframe-mode
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
  (ivy-posframe-mode 1))

(provide 'init-ivy)
