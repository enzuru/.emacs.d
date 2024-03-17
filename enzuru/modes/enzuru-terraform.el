;; -*- coding: utf-8; lexical-binding: t -*-

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
