;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-terraform ()
  (if (not (member 'company-terraform company-backends))
      (push 'company-terraform company-backends)))

(defun enzuru-configure-terraform ()
  (add-hook 'terraform-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'terraform-format-buffer))))

;; Packages

(use-package company-terraform
  :ensure t
  :hook ((terraform-mode . enzuru-configure-company-terraform)))

(use-package terraform-doc
  :ensure t
  :defer t)

(use-package terraform-mode
  :ensure t
  :config (enzuru-configure-terraform)
  :defer t)

(provide 'enzuru-terraform)
