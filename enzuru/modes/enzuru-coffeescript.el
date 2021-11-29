;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-coffee-mode ()
  (setq coffee-tab-width 2))

;; Packages

(use-package coffee-mode
  :ensure t
  :config (enzuru-configure-coffee-mode))

(provide 'enzuru-coffeescript)
