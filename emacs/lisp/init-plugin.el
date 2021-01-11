(setq package-archives '(("melpa" . "https://elpa.emacs-china.org/melpa/")
       ("org" . "https://elpa.emacs-china.org/org/")
       ("gnu" . "https://elpa.emacs-china.org/gnu/")))

(unless (bound-and-true-p package--initialized)
  (package-initialize)
  (setq package-enable-at-startup nil))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
;;  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(use-package diminish)

;; environment
(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

(use-package paradox
  :init
  (setq paradox-execute-asynchronously t
        paradox-github-token t
        paradox-display-star-count nil)
  (advice-add #'list-packages :before #'paradox-enable))

(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))

(provide 'init-plugin)
