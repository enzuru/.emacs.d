;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-web ()
  (add-to-list 'company-web-html company-backends))

(defun enzuru-configure-web-mode ()
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2))

;; Packages

(use-package company-web
  :ensure t
  :hook ((web-mode . enzuru-configure-company-web)))

(use-package web-mode
  :ensure t
  :config (enzuru-configure-web-mode)
  :mode (("\\.twig$" . web-mode)
         ("\\.erb$" . web-mode)))

(provide 'enzuru-web)
