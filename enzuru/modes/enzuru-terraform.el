;;; enzuru-terraform.el --- Terraform configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, terraform

;;; Commentary:

;; Configuration for Terraform.

;;; Code:

;; Functions

(defun enzuru-configure-terraform ()
  (add-hook 'terraform-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'terraform-format-buffer))))

;; Packages

(use-package terraform-doc
  :ensure t
  :defer t)

(use-package terraform-mode
  :ensure t
  :config (enzuru-configure-terraform)
  :defer t)

(provide 'enzuru-terraform)

;;; enzuru-terraform.el ends here
