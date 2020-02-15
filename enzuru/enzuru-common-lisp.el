(add-hook 'lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'sly-describe-function)
            (local-set-key (kbd "C-x C-w") 'sly-edit-definition-other-window)
            (local-set-key (kbd "C-x c") 'sly-eval-buffer)))

(add-hook 'lisp-mode-hook                        (lambda () (lispy-mode 1)))
(add-hook 'lisp-interaction-mode-hook            (lambda () (lispy-mode 1)))
