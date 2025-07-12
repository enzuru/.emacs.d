;;; enzuru-markdown.el --- Markdown configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, markdown

;;; Commentary:

;; Configuration for Markdown editing.

;;; Code:

;; Configuration

(defun enzuru-hook-markdown-mode ()
  ;; (setq-local completion-at-point-functions (mapcar #'cape-company-to-capf (list #'company-spell)))
  )

;; Packages

(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . enzuru-hook-markdown-mode))
  :mode (("\\.md$" . markdown-mode)
         ("\\.gmi$" . markdown-mode)))

(provide 'enzuru-markdown)

;;; enzuru-markdown.el ends here
