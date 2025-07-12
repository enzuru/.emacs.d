;;; enzuru-studying.el --- Programming study tools -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, learning, exercism

;;; Commentary:

;; This module provides utilities for programming studies including
;; Exercism integration.

;;; Code:

(defun enzuru-exercism-submit ()
  (interactive)
  (shell-command (concat "exercism submit " (buffer-file-name))))

(provide 'enzuru-studying)

;;; enzuru-studying.el ends here
