;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

;; (use-package company-spell
;;   :config (add-to-list 'company-spell company-backends)
;;   :ensure t)

;; Packages

(use-package flymake-aspell
  :ensure t
  :hook ((text-mode-hook . flymake-aspell-setup)))

(provide 'enzuru-spelling)
