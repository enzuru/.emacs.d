;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-golangci
  :ensure t
  :hook ((go-mode . flymake-golangci-load)))

(use-package go-mode
  :ensure t
  :defer t)

(provide 'enzuru-go)
