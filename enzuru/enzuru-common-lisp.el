;;(setq slime-contribs '(slime-fancy slime-asdf))
;;(slime-setup '(slime-company))
;;(require 'sly-autoloads)
;;(sly)

(add-hook 'sly-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'sly-describe-function)
            (local-set-key (kbd "C-x C-w") 'sly-edit-definition-other-window)
            (local-set-key (kbd "C-x c") 'sly-eval-buffer)))
