;;; enzuru-web.el --- Web development configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration


;; Packages

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :mode (("\\.twig$" . web-mode)
         ("\\.erb$" . web-mode)))

(provide 'enzuru-web)

;;; enzuru-web.el ends here
