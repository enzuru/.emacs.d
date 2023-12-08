;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package go-ts-mode
  :ensure t
  :defer t
  :hook ((go-ts-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)
