(require 'init-const)

(use-package org
  :init
  (global-flycheck-mode)
  :config
  (setq truncate-lines nil)
  (setq org-src-fontify-natively t)
  (setq org-highlight-latex-and-related '(native script entities))

  ;;todo
  (setq org-log-done 'time)
  (setq org-todo-keywords '(
    (sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(c@/!)")))
  (setq org-todo-keyword-faces '(("TODO" . "#6ed5fd")
                               ("DOING" . "gold")
                               ("DONE" . "#65c2bb")
                               ("ABORT" . "#FD9999")))

  ;; output
  (setq org-export-backends (quote (html md)))

  ;; keybingds
  :general
  (org-mode-map
    :states 'normal
    "t s" 'org-todo
    "SPC t r" 'org-update-statistics-cookie
    "SPC a c" 'org-insert-structure-template

    "r t a" 'org-roam-tag-add
    "r t d" 'org-roam-tag-delete))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :init
  :config
  (setq org-superstar-leading-bullet ?\s
        org-superstar-leading-fallback ?\s
        org-hide-leading-stars nil
        org-superstar-todo-bullet-alist
        '(("TODO" . 9744)
          ("[ ]"  . 9744)
          ("DONE" . 9745)
          ("[X]"  . 9745))))


(use-package org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("⚑" "⬆" "■")))

(use-package toc-org
  :hook (org-mode . toc-org-mode))

(use-package ob-js
  :ensure nil
  :after org
  :init
  (defvar org-babel-js-function-wrapper
    "console.log(JSON.stringify(require('util').inspect(function(){\n%s\n}())));"
    "Javascript code to print value of body.")
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
    '((js . t))))

(use-package ob-typescript
  :after org
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
    '((typescript . t))))

(use-package plantuml-mode
  :init
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-jar-path "~/.emacs.d/packages/plantuml.jar")
  (setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/packages/plantuml.jar"))
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (org-babel-do-load-languages 'org-babel-load-languages 
    '((plantuml . t))))

(use-package org-roam
    :diminish
    :custom (org-roam-directory dotfiles-roam-directory)
    :hook (after-init . org-roam-mode)
    :bind (:map org-roam-mode-map
           (("C-c n l" . org-roam)
            ("C-c n f" . org-roam-find-file)
            ("C-c n g" . org-roam-graph))
           :map org-mode-map
           (("C-c n i" . org-roam-insert))
           (("C-c n I" . org-roam-insert-immediate)))
    :config
    (unless (file-exists-p org-roam-directory)
      (make-directory org-roam-directory)))

(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
    org-roam-server-port 8080
    org-roam-server-authenticate nil
    org-roam-server-export-inline-images t
    org-roam-server-serve-files nil
    org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
    org-roam-server-network-poll t
    org-roam-server-network-arrows nil
    org-roam-server-network-label-truncate t
    org-roam-server-network-label-truncate-length 60
    org-roam-server-network-label-wrap-length 20))

(require 'init-capture)
(provide 'init-org)
