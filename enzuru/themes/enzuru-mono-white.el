;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-mono-white ()
  (load-theme 'almost-mono-white t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package almost-mono-themes
  :ensure t
  :config (enzuru-configure-mono-white))

(provide 'enzuru-mono-white)
