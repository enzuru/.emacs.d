;; -*- coding: utf-8; lexical-binding: t -*-

;;  Configuration

(defun enzuru-configure-diminish ()
  (diminish 'abbrev-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  (diminish 'undo-tree-mode)
  (diminish 'hyperbole-mode)
  (diminish 'eldoc-mode)
  (eval-after-load "hideshow" '(diminish 'hs-minor-mode)))

;; Packages

(use-package diminish
  :ensure t
  :config (enzuru-configure-diminish))

(provide 'enzuru-cleanup)
