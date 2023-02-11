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

(defun enzuru-configure-multi-term ()
  (setq multi-term-scroll-show-maximum-output t))

;; Packages

(use-package eshell
  :ensure t
  :bind (("C-c e" . eshell))
  :config (enzuru-configure-eshell))

(use-package multi-term
  :ensure t
  :defer t
  :config (enzuru-configure-multi-term))

(use-package shell
  :ensure t
  :defer t
  :config (enzuru-configure-shell))

;; (use-package vterm
;;   :ensure t
;;   ;; :bind (("C-c v" . vterm))
;;   )

(provide 'enzuru-terminal)
