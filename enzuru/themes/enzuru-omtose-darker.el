;;; enzuru-omtose-darker.el --- Omtose Darker theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Omtose Darker color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-omtose-theme ()
  (load-theme 'omtose-darker t)
  (set-face-background 'hl-line "#301934")
  (sml/apply-theme 'respectful)
  (set-face-background 'hl-line "#000000"))

;; Packages

(use-package omtose-phellack-theme
  :ensure (:host github :repo "franksn/omtose-phellack-theme")
  :config (enzuru-configure-omtose-theme))

(provide 'enzuru-omtose-darker)

;;; enzuru-omtose-darker.el ends here
