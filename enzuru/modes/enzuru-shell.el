;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-shell ()
  (add-to-list 'company-shell company-backends)
  (add-to-list 'company-shell-env company-backends)
  (add-to-list 'company-fish-shell company-backends))

;; Packages

(use-package company-shell
  :ensure t
  :hook ((shell-mode . enzuru-configure-company-shell)
         (fish-mode . enzuru-configure-company-shell)))

(provide 'enzuru-shell)
