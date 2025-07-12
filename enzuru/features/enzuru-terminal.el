;;; enzuru-terminal.el --- Terminal and shell configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, terminal, shell, eshell, eat

;;; Commentary:

;; This module configures terminal emulators and shell environments
;; including Eshell and EAT.

;;; Code:

;; Configuration

(defun enzuru-configure-eshell ()
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t))

(defun enzuru-configure-shell ()
  (when (file-name-nondirectory (getenv "SHELL")) "fish"
        (setq path-separator " ")
        (setq shell-switcher-mode t)))

;; Packages

(use-package eat
  :ensure t
  :bind (("C-c e" . eat))
  :defer t)

(enzuru-configure-shell)
(enzuru-configure-eshell)

(provide 'enzuru-terminal)

;;; enzuru-terminal.el ends here
