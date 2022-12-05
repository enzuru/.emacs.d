;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-semantic ()
  (global-ede-mode 1)
  (semantic-mode 1))

;; Packages

(use-package semantic
  :ensure t
  :defer t
  :hook ((c-mode . eglot-ensure))
  :config (enzuru-configure-semantic))

(provide 'enzuru-c)
