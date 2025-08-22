;;; enzuru-rust.el --- Rust programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, rust

;;; Commentary:

;; Configuration for Rust programming.

;;; Code:

;; Functions

(defun enzuru-configure-rust-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-ts-mode))
  (add-hook 'rust-ts-mode-hook 'racer-mode)
  (add-hook 'rust-ts-mode-hook 'eglot-ensure))

;; Packages

(use-package racer
  :ensure t
  :hook ((racer-mode . eldoc-mode)))

(use-package rust-playground
  :ensure t
  :defer t
  :custom
  (rust-playground-basedir "~/"))

(enzuru-configure-rust-ts-mode)

(provide 'enzuru-rust)

;;; enzuru-rust.el ends here
