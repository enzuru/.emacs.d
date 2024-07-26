;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-eshell ()
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t))

(defun enzuru-configure-shell ()
  (when (file-name-nondirectory (getenv "SHELL")) "fish"
        (setq path-separator " ")
        (setq shell-switcher-mode t)))

;; Packages

(use-package eshell
  :ensure t
  :config (enzuru-configure-eshell))

(use-package shell
  :ensure t
  :defer t
  :config (enzuru-configure-shell))

(use-package eat
  :ensure t
  :bind (("C-c e" . eat))
  :defer t)

(provide 'enzuru-terminal)
