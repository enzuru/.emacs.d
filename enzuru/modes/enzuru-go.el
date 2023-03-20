;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package go-mode
  :ensure t
  :defer t
  :hook ((go-mode . eglot-ensure)))

(provide 'enzuru-go)
