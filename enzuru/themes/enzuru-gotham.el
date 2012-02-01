;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-gotham-theme ()
  (load-theme 'gotham t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package gotham-theme
  :ensure t
  :config (enzuru-configure-gotham-theme))

(provide 'enzuru-gotham)
