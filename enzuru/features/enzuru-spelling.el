;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package company-spell
  :ensure t)

(use-package flymake-aspell
  :ensure t
  :hook ((text-mode-hook . flymake-aspell-setup)))

(provide 'enzuru-spelling)
