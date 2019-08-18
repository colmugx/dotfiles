;; more output
(setq org-export-backends (quote (ascii html latex md)))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2018basic/bin/x86_64-darwin/"))

(setq exec-path (append exec-path '("/usr/local/texlive/2018basic/bin/x86_64-darwin/")))

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

(provide 'init-org)
