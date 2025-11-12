;;; enzuru-undo.el --- Undo system configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-configure-undo-tree ()
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode))

;; Packages

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-c u" . undo-tree-visualize))
  :config (enzuru-configure-undo-tree))

(provide 'enzuru-undo)

;;; enzuru-undo.el ends here
