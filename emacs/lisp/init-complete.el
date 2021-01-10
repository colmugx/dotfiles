;; company
(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-require-match nil))

(use-package lsp-mode
  :diminish
  :commands (lsp lsp-symbol-highlight)
  :hook ((j2-mode . lsp)
         (typescript-mode . lsp))
  :init
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil
    lsp-ui-doc-enable t))

(use-package lsp-ivy 
  :after lsp-mode
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after lsp-mode
  :commands lsp-treemacs-errors-list)

(use-package company-lsp
  :after company
  :config
    (push 'company-lsp company-backends))

(provide 'init-complete)
