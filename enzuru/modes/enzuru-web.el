;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-web-mode ()
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2))

;; Packages

(use-package web-mode
  :ensure t
  :config (enzuru-configure-web-mode)
  :mode (("\\.twig$" . web-mode)
         ("\\.erb$" . web-mode)))

(provide 'enzuru-web)
