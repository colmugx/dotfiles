;; company
(use-package company
  :diminish
  :hook (after-init . global-company-mode)
  :bind (("C-SPC" . company-complete))
  :init
  (setq company-idle-delay 0
        company-tooltip-align-annotations t
        company-icon-margin 3
        company-minimum-prefix-length 2
        company-require-match nil))

(use-package company-box
  :diminish
  :hook (company-mode . company-box-mode)
  :init
  (setq company-box-backends-colors nil
        company-box-doc-delay 0.1))

(use-package lsp-mode
  :diminish
  :autoload lsp-enable-which-key-integration
  :hook ((lsp-mode . (lambda ()
                          (lsp-enable-which-key-integration)))))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :after lsp-mode
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after lsp-mode
  :commands lsp-treemacs-errors-list)

(provide 'init-complete)
