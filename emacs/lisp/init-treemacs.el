;; treemacs 文件树
(use-package treemacs
  :defer t
  :commands (treemacs-follow-mode
             treemacs-filewatch-mode
             treemacs-git-mode)
  :config
  (setq treemacs–icon-size 14)
  (setq treemacs-width 30)
  :general
  (general-define-key
   :prefix "SPC"
   :states '(emacs normal)
   :keymaps 'global
    "f t" 'treemacs))

(use-package treemacs-evil
  :after treemacs evil)

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package treemacs-magit
  :after magit
  :autoload treemacs-magit--schedule-update
  :hook ((magit-post-commit
          git-commit-post-finish
          magit-post-stage
          magit-post-unstage)
          . treemacs-magit--schedule-update))

(provide 'init-treemacs)
