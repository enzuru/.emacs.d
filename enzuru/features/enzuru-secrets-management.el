;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-password-store ()
  (password-store-init "enzuru"))

;; Packages

(use-package password-store
  :ensure t
  :config (enzuru-configure-password-store)
  :defer t)

(provide 'enzuru-secrets-management)
