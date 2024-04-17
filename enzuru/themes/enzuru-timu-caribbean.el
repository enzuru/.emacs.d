;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-timu-caribbean-theme ()
  (load-theme 'timu-caribbean t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-caribbean-theme
  :ensure t
  :config (enzuru-configure-timu-caribbean-theme))

(provide 'enzuru-timu-caribbean)
