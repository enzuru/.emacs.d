;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-markdownlint
  :ensure t
  :hook ((markdown-mode . flymake-markdownlint-setup)))

(use-package markdown-mode
  :ensure t
  :mode (("\\.md$" . markdown-mode)))

(provide 'enzuru-markdown)
