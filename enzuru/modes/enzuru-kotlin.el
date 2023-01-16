;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-kotlin-mode ()
  (setq kotlin-tab-width 4))

;; Packages

(use-package kotlin-mode
  :ensure t
  :config (enzuru-configure-kotlin-mode))

(provide 'enzuru-kotlin)
