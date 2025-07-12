;;; enzuru-syntax-highlighting.el --- Enhanced syntax highlighting -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, syntax, highlighting, prism

;;; Commentary:

;; This module configures enhanced syntax highlighting using Prism
;; for better code visualization.

;;; Code:

;; Configuration

(defun enzuru-configure-prism ()
  (add-hook 'lisp-mode-hook 'prism-mode)
  (add-hook 'emacs-lisp-mode-hook 'prism-mode)
  (add-hook 'scheme-mode-hook 'prism-mode)
  (add-hook 'json-mode-hook 'prism-mode)
  (add-hook 'yaml-mode-hook 'prism-mode)
  (add-hook 'clojure-mode-hook 'prism-mode))

;; Packages

(use-package prism
  :ensure (:host github :repo "alphapapa/prism.el")
  :config (enzuru-configure-prism))

(provide 'enzuru-syntax-highlighting)

;;; enzuru-syntax-highlighting.el ends here
