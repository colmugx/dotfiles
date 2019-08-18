
;; enable evil-mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; evil-leader
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(provide 'init-evil)
