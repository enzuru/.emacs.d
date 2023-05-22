;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-undo-tree ()
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;; Packages

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config (enzuru-configure-undo-tree))

(provide 'enzuru-undo)
