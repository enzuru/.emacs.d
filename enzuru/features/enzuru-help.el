;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-which-key ()
  (which-key-setup-side-window-right))

;; Packages

(use-package which-key
  :ensure t
  :defer t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(provide 'enzuru-help)
