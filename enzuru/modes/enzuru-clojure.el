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

(use-package clojure-snippets
  :ensure t
  :defer t)

(use-package flymake-kondor
  :ensure t
  :hook (clojure-mode . flymake-kondor-setup))

(provide 'enzuru-clojure)
