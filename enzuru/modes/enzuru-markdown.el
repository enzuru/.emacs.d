;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package markdown-mode
  :ensure t
  :mode (("\\.md$" . markdown-mode)
         ("\\.md$" . flyspell-mode)))

(provide 'enzuru-markdown)
