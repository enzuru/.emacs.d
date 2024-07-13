;; -*- coding: utf-8; lexical-binding: t -*-

(require 'auth-source)

;; Packages

(use-package gptel
  :ensure t
  :defer t
  :bind (:map gptel-mode-map
              ("C-c c" . gptel-send)))

(provide 'enzuru-llm)
