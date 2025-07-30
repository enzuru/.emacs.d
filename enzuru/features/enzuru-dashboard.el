;;; enzuru-dashboard.el --- Dashboard startup screen configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, dashboard, startup

;;; Commentary:

;; This module configures the Emacs dashboard startup screen.

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
