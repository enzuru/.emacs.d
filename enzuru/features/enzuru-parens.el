;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-smartparens ()
  (smartparens-global-mode)
  (show-smartparens-global-mode t))

;; Packages

(use-package smartparens
  :ensure t
  :config (enzuru-configure-smartparens))

(provide 'enzuru-parens)
