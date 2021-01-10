;; enable evil-mode
(use-package evil
  :config
  (evil-mode 1))

;; general
(use-package general
  :init
  (general-evil-setup t)
  (general-create-definer my-leader-def
  :prefix "SPC")
  (my-leader-def
    :keymaps 'override
    :states '(normal visual emacs motion)
    "b b" 'switch-to-buffer
    "b k" 'kill-buffer-and-window
    "b d" 'delete-window

    "t a" 'org-capture
    "r t a" 'org-roam-capture)
  (my-leader-def
    :keymaps 'override
    :states '(normal visual emacs motion)
    "f t" 'treemacs))

;; which-key 空格提示
(use-package which-key
  :config
  (which-key-mode 1))

(provide 'init-evil)
