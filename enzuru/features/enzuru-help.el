;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-which-key ()
  (setq which-key-popup-type 'minibuffer)
  (which-key-setup-minibuffer))

;; Packages

(use-package which-key
  :ensure t
  :defer t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(provide 'enzuru-help)
