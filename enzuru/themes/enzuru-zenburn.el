;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-zenburn-theme ()
  (load-theme 'zenburn t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package zenburn-theme
  :ensure t
  :config (enzuru-configure-zenburn-theme))

(provide 'enzuru-zenburn)
