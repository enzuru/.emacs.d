;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-rust-playground ()
  (setf rust-playground-basedir "~/"))

;; Packages

(use-package racer
  :ensure t
  :hook ((racer-mode . eldoc-mode)
         (racer-mode . company-mode)))

(use-package rust-mode
  :ensure t
  :hook ((rust-mode . racer-mode))
  :bind (:map rust-mode-map ("<tab>" . company-indent-or-complete-common)))

(use-package rust-playground
  :ensure t
  :config (enzuru-configure-rust-playground)
  :defer t)

(provide 'enzuru-rust)
