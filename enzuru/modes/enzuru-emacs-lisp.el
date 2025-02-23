;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-elisp-documentation-search ()
  (interactive)
  (describe-symbol (intern (thing-at-point 'symbol))))

(defun enzuru-configure-emacs-lisp-mode ()
  (eldoc-mode)
  (define-key emacs-lisp-mode-map (kbd "C-c d") 'enzuru-elisp-documentation-search)
  (define-key emacs-lisp-mode-map (kbd "C-c o") 'eval-buffer)
  (define-key emacs-lisp-mode-map (kbd "C-c i") 'describe-symbol))

(defun enzuru-run-ert-tests ()
  (let ((window (selected-window)))
    (eval-buffer)
    (ert-run-tests-interactively t)
    (select-window window)))

;; Packages

(use-package checkdoc
  :defer t)

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

(enzuru-configure-emacs-lisp-mode)

(provide 'enzuru-emacs-lisp)
