(defun sly-eval-buffer-and-switch ()
  (interactive)
  (sly-eval-buffer)
  (switch-to-buffer-other-window "*sly-mrepl for sbcl*"))

(add-hook 'lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'sly-describe-function)
            (local-set-key (kbd "C-x C-w") 'sly-edit-definition-other-window)
            (local-set-key (kbd "C-x c") 'sly-eval-buffer-and-switch)))

(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))
