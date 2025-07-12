;;; enzuru-cleanup.el --- Mode line cleanup configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, setup

;;; Commentary:

;; This module handles mode line cleanup by diminishing various minor modes
;; to reduce clutter in the mode line display.

;;; Code:

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

;;; enzuru-cleanup.el ends here
