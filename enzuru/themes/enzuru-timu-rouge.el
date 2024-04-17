;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-timu-rouge-theme ()
  (load-theme 'timu-rouge t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-rouge-theme
  :ensure t
  :config (enzuru-configure-timu-rouge-theme))

(provide 'enzuru-timu-rouge)
