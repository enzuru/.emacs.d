;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-rust-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  (add-hook 'rust-ts-mode-hook 'racer-mode)
  (add-hook 'rust-ts-mode-hook 'eglot-ensure))

(defun enzuru-configure-rust-playground ()
  (setf rust-playground-basedir "~/"))

;; Packages

(use-package racer
  :ensure t
  :hook ((racer-mode . eldoc-mode)
         (racer-mode . company-mode)))

(use-package rust-playground
  :ensure t
  :config (enzuru-configure-rust-playground)
  :defer t)

(enzuru-configure-rust-ts-mode)

(provide 'enzuru-rust)
