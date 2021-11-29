;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-undo-tree ()
  (global-undo-tree-mode))

;; Packages

(use-package undo-tree
  :ensure t
  :config (enzuru-configure-undo-tree))

(provide 'enzuru-undo-tree)
