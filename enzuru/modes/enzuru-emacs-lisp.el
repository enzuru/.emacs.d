;;; enzuru-emacs-lisp.el --- Emacs Lisp programming support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, lisp, emacs-lisp, programming

;;; Commentary:

;; This module configures Emacs Lisp programming support with package
;; development tools, linting, and enhanced documentation features.

;;; Code:

;; Functions

(defun enzuru-elisp-documentation-search ()
  (interactive)
  (describe-symbol (intern (thing-at-point 'symbol))))

(defun enzuru-configure-emacs-lisp-mode ()
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

(add-hook 'elpaca-after-init-hook 'eldoc-mode)

(enzuru-configure-emacs-lisp-mode)

(provide 'enzuru-emacs-lisp)

;;; enzuru-emacs-lisp.el ends here
