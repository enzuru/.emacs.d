;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (clojure-mode . clojure-ts-mode)
        (cpp-mode . cpp-ts-mode)
        (css-mode . css-ts-mode)
        (dockerfile-mode . dockerfile-ts-mode)
        (elixir-mode . elixir-ts-mode)
        (go-mode . go-ts-mode)
        (java-mode . java-ts-mode)
        (json-mode . json-ts-mode)
        (python-mode . python-ts-mode)
        (ruby-mode . ruby-ts-mode)
        (rust-mode . rust-ts-mode)
        (typescript-mode . typescript-ts-mode)))

(provide 'enzuru-tree-sitter)
