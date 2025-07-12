;;; enzuru-timu-macos.el --- Timu macOS theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Timu macOS color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-timu-macos-theme ()
  (load-theme 'timu-macos t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-macos-theme
  :ensure t
  :config (enzuru-configure-timu-macos-theme))

(provide 'enzuru-timu-macos)

;;; enzuru-timu-macos.el ends here
