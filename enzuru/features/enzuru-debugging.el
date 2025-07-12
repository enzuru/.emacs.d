;;; enzuru-debugging.el --- Debugging configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, debugging, edebug

;;; Commentary:

;; This module provides debugging configuration and utilities for Emacs.

;;; Code:

;; Functions

(defun enzuru-debugging-on ()
  (interactive)
  (setq debug-on-error t
        debug-on-event t
        debug-on-message t
        edebug-all-forms t))

;; (enzuru-debugging-on)

(provide 'enzuru-debugging)

;;; enzuru-debugging.el ends here
