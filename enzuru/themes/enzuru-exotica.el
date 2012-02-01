;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-exotica-theme ()
  (load-theme 'exotica t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package exotica-theme
  :ensure t
  :config (enzuru-configure-exotica-theme))

(provide 'enzuru-exotica)
