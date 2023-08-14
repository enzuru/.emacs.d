;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-ansible ()
  (add-to-list 'company-ansible company-backends))

;; Packages

(use-package company-ansible
  :ensure t
  :hook ((ansible-mode . enzuru-configure-ansible)))

(provide 'enzuru-ansible)
