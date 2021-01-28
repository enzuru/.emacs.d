(add-hook 'lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'sly-documentation)
            (local-set-key (kbd "C-x C-w") 'sly-edit-definition-other-window)
            (local-set-key (kbd "C-x c") 'sly-eval-buffer)))

(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))

(add-hook 'kill-buffer-hook (lambda ()
                              (if (cl-search "SDL" (buffer-name))
                                  (progn
                                    (delete-other-windows)
                                    (sly)))))
