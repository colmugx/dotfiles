(when (version< emacs-version "25.1")
  (error "This requires Emacs 25.1 and above!"))

(defvar centaur-gc-cons-upper-limit (if (display-graphic-p) 400000000 100000000)
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar centaur-gc-timer (run-with-idle-timer 10 t #'garbage-collect)
  "Run garbarge collection when idle 10s.")

(setq gc-cons-threshold centaur-gc-cons-upper-limit
  gc-cons-percentage 0.5)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;require
(require 'init-plugin)
(require 'init-basic)
(require 'init-evil)
(require 'init-ivy)
(require 'init-complete)
(require 'init-flycheck)
(require 'init-vcs)

(require 'init-org)
(require 'init-agenda)
(require 'init-markdown)
(require 'init-javascript)

(require 'init-ui)
(require 'init-tool)

(require 'init-other-keymap)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(go-translate doom-modeline doom-themes linum-relative typescript-mode htmlize org-preview-html markdown-toc org-roam-server org-roam plantuml-mode ob-typescript toc-org org-fancy-priorities org-download org-superstar git-timemachine magit flycheck company-lsp lsp-treemacs lsp-ivy lsp-ui lsp-mode company ivy-posframe ivy which-key general dashboard treemacs-projectile treemacs-evil treemacs auto-package-update paradox use-package hydra exec-path-from-shell diminish))
 '(safe-local-variable-values
   '((org-todo-keyword-faces
      ("UNREAD" . "#6ed5fd")
      ("READING" . "gold")
      ("DONE" . "#65c2bb")
      ("PAUSE" . "#fd9999"))))
 '(user-full-name "colmugx"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
