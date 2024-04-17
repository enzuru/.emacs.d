;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-timu-spacegrey-theme ()
  (load-theme 'timu-spacegrey t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-spacegrey-theme
  :ensure t
  :config (enzuru-configure-timu-spacegrey-theme))

(provide 'enzuru-timu-spacegrey)
