;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package go-mode
  :ensure t
  :defer t
  :hook ((go-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)
