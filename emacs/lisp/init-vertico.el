;;  -*- lexical-binding: t; -*-

(use-package vertico
  :diminish vertico-mode
  :hook (after-init . vertico-mode)
  :config
  (setq vertico-resize nil
        vertico-cycle t))

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package vertico-posframe
  :after vertico
  :diminish vertico-posframe-mode
  :init
  (vertico-posframe-mode 1))

(use-package embark
  :defer t
  :config
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package consult
  :defer t
  :general
  (general-define-key
   :prefix "SPC"
   :states '(emacs normal)
   :keymaps 'global
   "l s" 'consult-line
   "b b" 'consult-buffer))

;; (use-package consult-flycheck
;;   :after (consult flycheck))


(provide 'init-vertico)
