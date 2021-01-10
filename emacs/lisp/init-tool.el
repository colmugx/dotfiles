(use-package go-translate
  :init
  :config
    (setq go-translate-token-current (cons 430675 2721866130))
    (setq go-translate-base-url "https://translate.google.cn")
    (setq go-translate-local-language "zh-CN")
    (my-leader-def
    :keymaps 'override
    :states '(normal visual emacs motion)
    "t t" 'go-translate-popup-current))

(provide 'init-tool)
