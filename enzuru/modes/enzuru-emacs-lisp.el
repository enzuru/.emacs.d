;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-elisp-documentation-search ()
  (interactive)
  (describe-symbol (intern (thing-at-point 'symbol))))

;; Packages

(use-package checkdoc
  :ensure
  :defer t)

(use-package eros
  :ensure t
  :config (eros-mode 1))

(use-package package-build
  :ensure t
  :defer t)

(use-package package-lint
  :ensure t
  :defer t)

(use-package package-lint-flymake
  :ensure t
  :hook ((emacs-lisp-mode . package-lint-flymake-setup))
  :defer t)

;; Hooks

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (eldoc-mode)
            (define-key emacs-lisp-mode-map (kbd "C-x C-d") 'enzuru-elisp-documentation-search)
            (define-key emacs-lisp-mode-map (kbd "C-x C-w") 'find-function-at-point)
            (define-key emacs-lisp-mode-map (kbd "C-x c") 'eval-buffer)
            (define-key emacs-lisp-mode-map (kbd "C-x r") 'eval-region)))

(provide 'enzuru-emacs-lisp)
