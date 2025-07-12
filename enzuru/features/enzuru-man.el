;;; enzuru-man.el --- Manual page utilities -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, documentation, man

;;; Commentary:

;; This module provides utilities for viewing manual pages.

;;; Code:

;; Functions

(defun enzuru-man-open ()
  (interactive)
  (manual-entry (current-word)))

(provide 'enzuru-man)

;;; enzuru-man.el ends here
