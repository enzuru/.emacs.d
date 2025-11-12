;;; enzuru-dashboard.el --- Dashboard startup screen configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-dashboard ()
  (dashboard-setup-startup-hook))

;; Packages

(use-package dashboard
  :ensure t
  :config (enzuru-configure-dashboard)
  :custom (inhibit-startup-screen t))

(provide 'enzuru-dashboard)

;;; enzuru-dashboard.el ends here
