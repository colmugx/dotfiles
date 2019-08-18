
(use-package lsp-rust
  :ensure t
  :commands lsp-rust-enable
  :hook (rust-mode . lsp-rust-enable)
  :config (lsp-org-babel-enbale "rust"))

(provide 'init-rust)
