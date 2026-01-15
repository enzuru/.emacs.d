;;; enzuru-rust.el --- Rust programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-rust-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-ts-mode))
  (add-hook 'rust-ts-mode-hook 'eglot-ensure))

;; Packages

(use-package rust-playground
  :ensure t
  :defer t
  :custom
  (rust-playground-basedir "~/"))

(enzuru-configure-rust-ts-mode)

(provide 'enzuru-rust)

;;; enzuru-rust.el ends here
