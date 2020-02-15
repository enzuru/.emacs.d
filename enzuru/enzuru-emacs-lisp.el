(add-hook 'lispy-mode-hook 'rainbow-delimiters-mode)

(defun elisp-documentation-search ()
  (interactive)
  (elisp-index-search (thing-at-point 'symbol)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'elisp-documentation-search)
            (local-set-key (kbd "C-x C-w") 'find-function-at-point)
            (local-set-key (kbd "C-x c") 'eval-buffer)))

(add-hook 'emacs-lisp-mode-hook                  (lambda () (lispy-mode 1)))
(add-hook 'eval-expression-minibuffer-setup-hook (lambda () (lispy-mode 1)))
(add-hook 'ielm-mode-hook                        (lambda () (lispy-mode 1)))

(add-to-list 'auto-mode-alist '("\\.hypb$" . lisp-mode))
