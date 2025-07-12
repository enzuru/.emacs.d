;;; enzuru-uname.el --- System information utilities -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, system, uname

;;; Commentary:

;; This module provides utilities for getting system information
;; such as the operating system name.

;;; Code:

(defun enzuru-uname ()
  (intern (string-trim (shell-command-to-string "uname"))))

(provide 'enzuru-uname)

;;; enzuru-uname.el ends here
