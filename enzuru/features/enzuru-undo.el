;;; enzuru-undo.el --- Undo system configuration -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package vundo
  :ensure t
  :bind (("C-c u" . vundo)))

(provide 'enzuru-undo)

;;; enzuru-undo.el ends here
