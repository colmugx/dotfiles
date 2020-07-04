
;; javascript
(use-package js-mode
	:ensure t)

;; jsx
(use-package rjsx-mode
	:ensure t)

;; typescript
(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx\\'" . typescript-mode))

(use-package lsp-typescript
	:ensure t
  :commands lsp-typescript-enable
  :hook ((typescript-mode js2-mode rjsx-mode) . lsp-typescript-enable))



(provide 'init-javascript)
