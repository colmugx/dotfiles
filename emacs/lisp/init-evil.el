(use-package evil
  :config
  (evil-mode 1))

;; general
(use-package general
  :init
  (general-evil-setup t)
  (general-create-definer my-leader-def :prefix "SPC")
  (my-leader-def
    :keymaps 'override
    :states '(normal visual emacs motion)
    "b k" 'kill-buffer-and-window
    "b d" 'delete-window

    "t a" 'org-capture))

;; which-key 空格提示
(use-package which-key
  :hook (after-init . which-key-mode)
  :init (setq which-key-max-description-length 30
              which-key-show-remaining-keys t))

(provide 'init-evil)
