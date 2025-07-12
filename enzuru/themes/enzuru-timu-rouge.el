;;; enzuru-timu-rouge.el --- Timu Rouge theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Timu Rouge color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-timu-rouge-theme ()
  (load-theme 'timu-rouge t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-rouge-theme
  :ensure t
  :config (enzuru-configure-timu-rouge-theme))

(provide 'enzuru-timu-rouge)

;;; enzuru-timu-rouge.el ends here
