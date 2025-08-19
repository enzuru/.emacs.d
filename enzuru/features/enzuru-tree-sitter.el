;;; enzuru-tree-sitter.el --- Tree-sitter parsing configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, parsing, tree-sitter, syntax

;;; Commentary:

;; This module configures Tree-sitter for enhanced syntax parsing
;; and enables automatic mode remapping to Tree-sitter modes.

;;; Code:

;; Configuration

(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode))

(provide 'enzuru-tree-sitter)

;;; enzuru-tree-sitter.el ends here
