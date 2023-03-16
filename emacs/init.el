(when (version< emacs-version "26.1")
  (error "This requires Emacs 26.1 and above!"))

(setq gc-cons-threshold most-positive-fixnum)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;require
(require 'init-plugin)

(require 'init-base)
(require 'init-ui)
(require 'init-tool)

(require 'init-evil)
(require 'init-treemacs)
(require 'init-complete)
(require 'init-ivy)

(require 'init-flycheck)
(require 'init-vcs)

(require 'init-org)
(require 'init-agenda)
(require 'init-markdown)
(require 'init-web)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(typescript-mode prettier js2-mode htmlize org-preview-html markdown-toc plantuml-mode ob-typescript toc-org org-fancy-priorities org-download org-superstar git-timemachine magit flycheck ivy-posframe lsp-treemacs lsp-ivy lsp-ui lsp-mode company treemacs-projectile treemacs-evil treemacs which-key general evil go-translate all-the-icons doom-modeline doom-themes linum-relative dashboard auto-package-update paradox exec-path-from-shell diminish use-package))
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
