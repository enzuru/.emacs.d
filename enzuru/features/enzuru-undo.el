;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-undo-tree ()
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;; Packages

(use-package undo-tree
  :ensure t
  :defer t
  :diminish undo-tree-mode
  :bind (("C-c u" . undo-tree-visualize))
  :config (enzuru-configure-undo-tree))

(provide 'enzuru-undo)
