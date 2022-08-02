;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package markdown-mode
  :ensure t
  :mode (("\\.md$" . markdown-mode))
  :hook ((markdown-mode . flyspell-mode)))

(provide 'enzuru-markdown)
