;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-c-mode ()
  (add-hook 'c-mode-hook 'eglot-ensure))

(defun enzuru-configure-semantic ()
  (global-ede-mode 1)
  (semantic-mode 1))

;; Packages

(use-package semantic
  :ensure t
  :defer t
  :config (enzuru-configure-semantic))

(enzuru-configure-c-mode)

(provide 'enzuru-c)
