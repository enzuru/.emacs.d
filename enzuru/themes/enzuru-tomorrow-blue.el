;;; enzuru-tomorrow-blue.el --- Tomorrow Blue theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Tomorrow Blue color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-tomorrow-blue ()
  (load-theme 'sanityinc-tomorrow-blue t)
  (set-face-attribute 'fringe nil :background "#002451" :foreground "#FFFFFF")
  (sml/apply-theme 'light)
  (set-face-background 'hl-line "#FF0000"))

;; Packages

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config (enzuru-configure-tomorrow-blue))

(provide 'enzuru-tomorrow-blue)

;;; enzuru-tomorrow-blue.el ends here
