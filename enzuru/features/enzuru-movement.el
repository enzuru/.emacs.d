;;; enzuru-movement.el --- Window and cursor movement configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, movement, windmove

;;; Commentary:

;; This module configures window and cursor movement utilities.

;;; Code:

;; Configuration

(defun enzuru-configure-windmove ()
  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings)))

;; Packages

(enzuru-configure-windmove)

(provide 'enzuru-movement)

;;; enzuru-movement.el ends here
