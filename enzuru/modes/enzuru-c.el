;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-semantic ()
  (global-ede-mode 1)
  (semantic-mode 1))

;; Packages

(use-package semantic
  :ensure t
  :defer t
  :config (enzuru-configure-semantic))

(provide 'enzuru-c)
