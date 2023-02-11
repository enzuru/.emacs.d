;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-elisp-documentation-search ()
  (interactive)
  (describe-symbol (intern (thing-at-point 'symbol))))

;; Hooks

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (eldoc-mode)
            (define-key emacs-lisp-mode-map (kbd "C-x C-d") 'enzuru-elisp-documentation-search)
            (define-key emacs-lisp-mode-map (kbd "C-x C-w") 'find-function-at-point)
            (define-key emacs-lisp-mode-map (kbd "C-x c") 'eval-buffer)))

(provide 'enzuru-emacs-lisp)
