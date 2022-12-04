;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flycheck-rust
  :ensure t
  :defer t)

(use-package racer
  :ensure t
  :defer t
  :hook ((racer-mode . eldoc-mode)
         (racer-mode . company-mode)))

(use-package rust-mode
  :ensure t
  :defer t
  :hook ((rust-mode . racer-mode))
  :bind (:map rust-mode-map ("<tab>" . company-indent-or-complete-common)))

(provide 'enzuru-rust)
