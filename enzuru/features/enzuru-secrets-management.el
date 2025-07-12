;;; enzuru-secrets-management.el --- Password and secrets management -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, password, secrets, security

;;; Commentary:

;; This module configures password and secrets management using
;; password-store (pass).

;;; Code:

;; Configuration

(defun enzuru-configure-password-store ()
  (password-store-init "enzuru"))

;; Packages

(use-package password-store
  :ensure t
  :config (enzuru-configure-password-store)
  :defer t)

(provide 'enzuru-secrets-management)

;;; enzuru-secrets-management.el ends here
