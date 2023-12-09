;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package go-ts-mode
  :ensure t
  :defer t
  :bind (:map go-ts-mode-map (("C-x C-d" . godoc-at-point)))
  :hook ((go-ts-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)
