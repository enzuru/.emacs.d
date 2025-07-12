;; -*- coding: utf-8; lexical-binding: t -*-

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
