;;; enzuru-exotica.el --- Exotica theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Exotica color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-exotica-theme ()
  (load-theme 'exotica t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package exotica-theme
  :ensure t
  :config (enzuru-configure-exotica-theme))

(provide 'enzuru-exotica)

;;; enzuru-exotica.el ends here
