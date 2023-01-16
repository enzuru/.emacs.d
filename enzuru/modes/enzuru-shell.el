;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-shellcheck
  :ensure t
  :hook ((sh-mode . flymake-shellcheck-load)))

(provide 'enzuru-shell)
