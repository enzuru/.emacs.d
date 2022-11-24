;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package cider
  :ensure t
  :bind (:map clojure-mode-map
              ("C-x c" . cider-eval-buffer)))

(use-package clojure-mode
  :ensure t)

(use-package flycheck-clojure
  :ensure t)

(provide 'enzuru-clojure)
