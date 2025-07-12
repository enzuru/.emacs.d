;;; enzuru-timu-spacegrey.el --- Timu Spacegrey theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Timu Spacegrey color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-timu-spacegrey-theme ()
  (load-theme 'timu-spacegrey t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-spacegrey-theme
  :ensure t
  :config (enzuru-configure-timu-spacegrey-theme))

(provide 'enzuru-timu-spacegrey)

;;; enzuru-timu-spacegrey.el ends here
