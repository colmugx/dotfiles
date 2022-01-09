(require 'init-const)

(use-package org-agenda
  :ensure nil
  :config
  (setq org-agenda-tags-column -16)
  (setq org-agenda-block-separator "---")
  (setq org-agenda-files
    (list
      (concat dotfiles-roam-directory "/books.org")
      (concat dotfiles-org-directory "/records.org")
      (concat dotfiles-roam-directory "/products")))
  (setq org-agenda-include-diary t))

  ;; keybingds
  (my-leader-def
    :keymaps 'override
    :states '(normal visual emacs motion)
    "a a" 'org-agenda)
  
  ;; custom
  (setq org-agenda-custom-commands
  '(
    ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)

    ("g" "目标计划"
      ((agenda ""
        ((org-agenda-span 'fortnight)))
       (tags "+GTYPE=\"Year\"" 
        ((org-agenda-overriding-header "年计划")))
       (tags-todo "+GTYPE=\"Quarter\"+DEADLINE<=\"<+90d>\""
        ((org-agenda-overriding-header "季度计划")))
       (tags-todo "+GTYPE=\"Month\"+DEADLINE<=\"<+30d>\""
        ((org-agenda-overriding-header "月计划")))
       (alltodo ""
        ((org-agenda-overriding-header "未设置"))))
      ((org-agenda-files
        (list
         (concat dotfiles-org-directory "/goals.org")))))

    ("b" "阅读计划"
      ((todo "READING"
        ((org-agenda-overriding-header "正在阅读")))
       (todo "NEXT"
        ((org-agenda-overriding-header "下一本")))
       (todo "DONE"
        ((org-agenda-overriding-header "已读完")))
       (todo "UNREAD"
        ((org-agenda-overriding-header "未阅读")))
       (todo "PAUSE"
        ((org-agenda-overriding-header "搁置"))))
      ((org-agenda-files
        (list
         (concat dotfiles-roam-directory "/books.org")))))
  ))

(provide 'init-agenda)