;;; enzuru-haskell.el --- Haskell programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, haskell

;;; Commentary:

;; Configuration for Haskell programming.

;;; Code:

;; Configure

(defun enzuru-configure-haskell-mode ()
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskeull-indent)
  (put 'downcase-region 'disabled nil))

;; Packages

(use-package dante
  :ensure t
  :defer t)

(use-package haskell-mode
  :ensure t
  :defer t
  :config (enzuru-configure-haskell-mode))

;;(use-package intero
;;  :ensure t
;;  :hook ((haskell-mode . intero-mode)))

(provide 'enzuru-haskell)

;;; enzuru-haskell.el ends here
