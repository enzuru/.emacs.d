;;; enzuru-undo.el --- Undo system configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, undo, undo-tree

;;; Commentary:

;; This module configures the undo system using undo-tree for
;; enhanced undo/redo functionality with visualization.

;;; Code:

(defun enzuru-configure-undo-tree ()
  (global-undo-tree-mode))

;; Packages

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-c u" . undo-tree-visualize))
  :custom
  (undo-tree-auto-save-history nil)
  :config (enzuru-configure-undo-tree))

(provide 'enzuru-undo)

;;; enzuru-undo.el ends here
