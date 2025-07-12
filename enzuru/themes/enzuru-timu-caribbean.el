;;; enzuru-timu-caribbean.el --- Timu Caribbean theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Timu Caribbean color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-timu-caribbean-theme ()
  (load-theme 'timu-caribbean t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-caribbean-theme
  :ensure t
  :config (enzuru-configure-timu-caribbean-theme))

(provide 'enzuru-timu-caribbean)

;;; enzuru-timu-caribbean.el ends here
