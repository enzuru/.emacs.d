;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package cider
  :ensure t
  :defer t
  :bind (:map clojure-mode-map
              ("C-x c" . cider-eval-buffer)))

(use-package clojure-mode
  :ensure t
  :defer t)

(provide 'enzuru-clojure)
