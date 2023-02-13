;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-go ()
  (if (not (member 'company-go company-backends))
      (push 'company-go company-backends)))

;; Packages

(use-package company-go
  :ensure t
  :hook ((go-mode . enzuru-configure-company-go)))

(use-package go-mode
  :ensure t
  :defer t)

(use-package go-projectile
  :ensure t
  :defer t)

(provide 'enzuru-go)
