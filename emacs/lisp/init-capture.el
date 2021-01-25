;; org-mode
(setq org-default-notes-file (lambda () (concat dotfiles-org-directory "/index.org")))
(setq org-capture-templates
  '(
    (
      "b" "Book"
      entry
      (file (lambda () (concat dotfiles-roam-directory "/books.org")))
      "* UNREAD %^{BookName} %^g\n** COMMENT 基本信息\n" :clock-in t :clock-resume t)

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
      :file-name "zk_card/%<%Y%m%d%H%M>-${slug}"
      :head "#+title: %<%Y%m%d%H%M>\n"
      :unnarrowed t)
    ("k" "knowledge" plain (function org-roam-capture--get-point)
      "%?"
      :file-name "knowledges/${title}"
      :head "#+title: ${title}\n"
      :unnarrowed t)
    ("n" "note" plain (function org-roam-capture--get-point)
      "%?"
      :file-name "notes/${title}"
      :head "#+title: ${title}\n"
      :unnarrowed t)
  ))

(provide 'init-capture)
