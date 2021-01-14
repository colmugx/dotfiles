;; org-mode
(setq org-default-notes-file (lambda () (concat dotfiles-org-directory "/index.org")))
(setq org-capture-templates
  '(
    (
      "b" "Book"
      entry
      (file (lambda () (concat dotfiles-org-directory "/books.org")))
      "* UNREAD %^{BookName} %^g\n ** 基本信息\n%a\n" :clock-in t :clock-resume t :empty-lines 1)

    (
      "t" "Task"
      entry
      (file+headline (lambda () (concat dotfiles-org-directory "/todo.org")) "Tasks")
      "* TODO %?\n  %u\n  %a")

    (
      "j" "Journal"
      entry
      (file+datetree (lambda () (concat dotfiles-org-directory "/records.org")))
      "** %t%?" :empty-lines 1
    )
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
