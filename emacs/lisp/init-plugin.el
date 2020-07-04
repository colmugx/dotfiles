(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "https://elpa.emacs-china.org/melpa/")
       ("org" . "https://elpa.emacs-china.org/org/")
       ("gnu" . "https://elpa.emacs-china.org/gnu/")))


(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

;; environment
(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)))


(provide 'init-plugin)
