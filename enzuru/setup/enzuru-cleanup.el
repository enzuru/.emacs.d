;; -*- coding: utf-8; lexical-binding: t -*-

(require 'midnight)
(midnight-delay-set 'midnight-delay "8:00pm")

;;  Configuration

(defun enzuru-configure-diminish ()
  (diminish 'abbrev-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  (diminish 'undo-tree-mode)
  (diminish 'company-mode)
  (diminish 'hyperbole-mode)
  (eval-after-load "hideshow" '(diminish 'hs-minor-mode)))

;; Packages

(use-package diminish
  :ensure t
  :config (enzuru-configure-diminish))

(provide 'enzuru-cleanup)
