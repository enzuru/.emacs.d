;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-dracula-theme ()
  (load-theme 'dracula t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package dracula-theme
  :ensure t
  :config (enzuru-configure-dracula-theme))

(provide 'enzuru-dracula)
