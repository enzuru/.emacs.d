;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-org ()
  (setq org-log-done t
        org-src-fontify-natively t
        org-startup-folded nil))

;; Packages

(use-package org
  :ensure t
  :config (enzuru-configure-org))

(provide 'enzuru-org)
