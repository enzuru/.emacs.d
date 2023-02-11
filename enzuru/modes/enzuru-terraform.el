;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-terraform ()
  (if (not (member 'company-terraform company-backends))
      (push 'company-terraform company-backends)))

;; Packages

(use-package company-terraform
  :ensure t
  :hook ((terraform-mode . enzuru-configure-company-terraform)))

(use-package terraform-mode
  :ensure t
  :defer t)

(provide 'enzuru-terraform)
