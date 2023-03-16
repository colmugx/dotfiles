(require 'init-const)

(use-package org
  :init
  (global-flycheck-mode)
  :config
  (setq org-tags-column -16)
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
  (setq org-link-abbrev-alist
    '(
      ("google" . "http://www.google.com/search?q=")
      ("mdnjs" . "https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/%s")
      ("douban" . "https://book.douban.com/subject/%s")))

  ;; output
  (setq org-html-postamble nil)
  (setq org-export-backends (quote (html md)))
  (setq org-export-with-section-numbers nil)
  (setq org-export-default-language "zh-CN")

  ;; keybingds
  :general
  (org-mode-map
    :states 'normal
    "t s" 'org-todo
    "SPC t r" 'org-update-statistics-cookie
    "SPC a c" 'org-insert-structure-template))

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

(use-package org-download
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  (setq org-download-method 'attach)
  (setq org-download-display-inline-images 'posframe))

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
  (setq org-startup-with-inline-images t)
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (org-babel-do-load-languages 'org-babel-load-languages
    '((plantuml . t))))

(provide 'init-org)
