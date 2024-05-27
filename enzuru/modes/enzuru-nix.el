;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package nix-mode
  :ensure t
  :mode (("\.nix$" . nix-mode)))

(provide 'enzuru-nix)
