;; org-mode
(setq org-default-notes-file (lambda () (concat dotfiles-org-directory "/index.org")))
(setq org-capture-templates
  '(
    ("b" "Book" entry (file (lambda () (concat dotfiles-org-directory "/books.org"))) "* %^{book name}\n author: %^{author} %^g")
    ("t" "Task" entry (file+headline (lambda () (concat dotfiles-org-directory "/todo.org")) "Tasks") "* TODO %?\n  %u\n  %a")
  ))


;; org-roam
(setq org-roam-capture-templates
  '(
    ("d" "default" plain (function org-roam-capture--get-point)
      "%?"
      :file-name "zk_card/%<%Y%m%d%H%M>"
      :head "#+title: %<%Y%m%d%H%M>\n"
      :unnarrowed t)
  ))

(provide 'init-capture)
