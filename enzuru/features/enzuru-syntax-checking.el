;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-flycheck ()
    (with-eval-after-load 'flycheck
      (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
  (global-flycheck-mode))

;; Packages

(use-package flycheck
  :ensure t
  :config (enzuru-configure-flycheck))

(provide 'enzuru-syntax-checking)

