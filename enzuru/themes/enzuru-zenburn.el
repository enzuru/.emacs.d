;;; enzuru-zenburn.el --- Zenburn theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Zenburn color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-zenburn-theme ()
  (load-theme 'zenburn t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package zenburn-theme
  :ensure t
  :config (enzuru-configure-zenburn-theme))

(provide 'enzuru-zenburn)

;;; enzuru-zenburn.el ends here
