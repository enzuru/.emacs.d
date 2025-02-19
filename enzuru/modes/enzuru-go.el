;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package go-ts-mode
  :defer t
  :bind (:map go-ts-mode-map (("C-c d" . godoc-at-point)))
  :hook ((go-ts-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)
