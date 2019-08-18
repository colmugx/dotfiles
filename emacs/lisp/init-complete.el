;; company
(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-require-match nil))

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t))

(use-package company-lsp
  :ensure t
  :after company
  :defines company-backends)


(provide 'init-complete)
