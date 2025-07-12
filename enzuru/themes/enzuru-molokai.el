;;; enzuru-molokai.el --- Molokai theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Molokai color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-molokai-theme ()
  (load-theme 'molokai t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package molokai-theme
  :ensure t
  :config (enzuru-configure-molokai-theme))

(provide 'enzuru-molokai)

;;; enzuru-molokai.el ends here
