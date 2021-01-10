(use-package markdown-mode
  :mode ((".md" . gfm-mode))
  :init
  (setq markdown-enable-wiki-links t
        markdown-italic-underscore t
        markdown-asymmetric-header t
        markdown-make-gfm-checkboxes-buttons t
        markdown-gfm-uppercase-checkbox t
        markdown-fontify-code-blocks-natively t
        markdown-content-type "application/xhtml+xml"))

(use-package markdown-toc
  :bind (:map markdown-mode-command-map
    ("r" . markdown-toc-generate-or-refresh-toc)))

(use-package org-preview-html)

(provide 'init-markdown)
