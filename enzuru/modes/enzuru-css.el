;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-css
  :ensure t
  :config (enzuru-configure-flymake-css)
  :hook ((css-mode . flymake-css-load)))

(provide 'enzuru-css)
