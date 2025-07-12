;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration


;; Packages

(use-package yaml-mode
  :ensure t
  :defer t
  :custom
  (yaml-indent-offset 2))

(provide 'enzuru-yaml)
