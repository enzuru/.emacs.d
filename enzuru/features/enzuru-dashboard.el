;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-dashboard ()
  (dashboard-setup-startup-hook))

;; Packages

(use-package dashboard
  :ensure t
  :config (enzuru-configure-dashboard))

(provide 'enzuru-dashboard)
