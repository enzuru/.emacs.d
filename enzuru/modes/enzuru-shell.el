;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-shell ()
  (cl-pushnew 'company-shell company-backends)
  (cl-pushnew 'company-shell-env company-backends)
  (cl-pushnew 'company-fish-shell company-backends))

(defun enzuru-configure-em-smart ()
  (setq eshell-where-to-jump 'begin)
  (setq eshell-review-quick-commands nil)
  (setq eshell-smart-space-goes-to-end t))

;; Packages

(use-package company-shell
  :ensure t
  :hook ((shell-mode . enzuru-configure-company-shell)
         (fish-mode . enzuru-configure-company-shell)))

(require 'em-smart)
(enzuru-configure-em-smart)

(provide 'enzuru-shell)
