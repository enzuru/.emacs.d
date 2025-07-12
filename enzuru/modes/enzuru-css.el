;;; enzuru-css.el --- CSS styling language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, css, web, styling

;;; Commentary:

;; This module configures CSS language support with Tree-sitter
;; for enhanced syntax highlighting and editing.

;;; Code:

;; Configuration

(defun enzuru-configure-css-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.css$" . css-ts-mode)))

(enzuru-configure-css-ts-mode)

(provide 'enzuru-css)

;;; enzuru-css.el ends here
