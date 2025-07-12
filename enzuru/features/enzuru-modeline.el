;;; enzuru-modeline.el --- Mode line configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, modeline, smart-mode-line

;;; Commentary:

;; This module configures the mode line appearance using Smart Mode Line.

;;; Code:

;; Configuration

(defun enzuru-configure-sml ()
  (sml/setup))

;; Packages

(use-package smart-mode-line
  :ensure t
  :custom
  (sml/mode-width 'full)
  (sml/name-width 20)
  (sml/shorten-modes t)
  (sml/no-confirm-load-theme t)
  :config (enzuru-configure-sml))

;; Variables

(column-number-mode t)

(provide 'enzuru-modeline)

;;; enzuru-modeline.el ends here
