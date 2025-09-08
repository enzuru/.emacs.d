;;; enzuru-catppuccin.el --- Catppuccin theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Catppuccin color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-catppuccin-theme ()
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package catppuccin-theme
  :ensure t
  :config (enzuru-configure-catppuccin-theme))

(provide 'enzuru-catppuccin)

;;; enzuru-catppuccin.el ends here
