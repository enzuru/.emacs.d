;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-timu-macos-theme ()
  (load-theme 'timu-macos t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-macos-theme
  :ensure t
  :config (enzuru-configure-timu-macos-theme))

(provide 'enzuru-timu-macos)
