;; -*- coding: utf-8; lexical-binding: t -*-

;; Configure

(defun enzuru-configure-haskell-mode ()
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskeull-indent)
  (put 'downcase-region 'disabled nil))

;; Packages

(use-package flycheck-haskell
  :ensure t)

(use-package haskell-mode
  :ensure t
  :config (enzuru-configure-haskell-mode))

(provide 'enzuru-haskell)
