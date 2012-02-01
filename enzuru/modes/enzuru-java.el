;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package lsp-java
  :ensure t
  :bind (:map java-mode-map
              ("C-x C-r" . lsp-ui-peek-find-references)
              ("C-x C-w" . lsp-ui-peek-find-definitions)))

(provide 'enzuru-java)
