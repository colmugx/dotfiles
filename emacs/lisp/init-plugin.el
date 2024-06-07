(setq package-archives '(("melpa" . "http://1.15.88.122/melpa/")
       ("org" . "http://1.15.88.122/org/")
       ("gnu" . "http://1.15.88.122/gnu/")))

(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  ; (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(use-package diminish)
(use-package bind-key)

;; environment
(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

(use-package paradox
  :hook (emacs-startup . paradox-enable)
  :init
  (setq paradox-execute-asynchronously t
        paradox-github-token t
        paradox-display-star-count nil))

(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'package-update-all #'auto-package-update-now))

(provide 'init-plugin)
