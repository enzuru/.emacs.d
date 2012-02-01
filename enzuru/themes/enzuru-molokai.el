;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-molokai-theme ()
  (load-theme 'molokai t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package molokai-theme
  :ensure t
  :config (enzuru-configure-molokai-theme))

(provide 'enzuru-molokai)
