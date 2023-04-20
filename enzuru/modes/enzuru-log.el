;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package itail
  :hook ((itail-mode . auto-revert-mode))
  :mode (("\\log$" . itail-mode))
  :ensure t)

(provide 'enzuru-logs)
