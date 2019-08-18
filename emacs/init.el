(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;require
(require 'init-plugin)
(require 'init-evil)
(require 'init-global)
(require 'init-javascript)
(require 'init-rust)
(require 'init-org)
(require 'init-complete)
(require 'init-ui)
(require 'init-keybindings)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fancy-splash-image nil)
 '(package-selected-packages (quote (evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
