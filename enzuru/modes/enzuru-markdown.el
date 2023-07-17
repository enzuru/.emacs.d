;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package markdown-mode
  :ensure t
  :mode (("\\.md$" . markdown-mode)
         ("\\.gmi$" . markdown-mode)))

(provide 'enzuru-markdown)
