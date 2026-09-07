;;; enzuru-kotlin.el --- Kotlin programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration


;; Packages

(use-package kotlin-ts-mode
  :ensure t
  :defer t
  :mode (("\\.kts?\\'" . kotlin-ts-mode))
  :custom
  (kotlin-ts-mode-indent-offset 4))

(provide 'enzuru-kotlin)

;;; enzuru-kotlin.el ends here
