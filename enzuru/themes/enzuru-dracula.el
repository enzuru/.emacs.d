;;; enzuru-dracula.el --- Dracula theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Dracula color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-dracula-theme ()
  (load-theme 'dracula t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package dracula-theme
  :ensure t
  :config (enzuru-configure-dracula-theme))

(provide 'enzuru-dracula)

;;; enzuru-dracula.el ends here
