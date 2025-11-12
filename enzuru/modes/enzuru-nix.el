;;; enzuru-nix.el --- Nix configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package nix-mode
  :ensure t
  :mode (("\.nix$" . nix-mode)))

(provide 'enzuru-nix)

;;; enzuru-nix.el ends here
