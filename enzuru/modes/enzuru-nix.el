;;; enzuru-nix.el --- Nix configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-nix ()
  (add-hook 'find-file-hook
  (lambda ()
    (when (string= (buffer-name) "configuration.nix")
      (set (make-local-variable 'compile-command) "sudo nixos-rebuild switch --flake .")))))

;; Packages

(use-package nix-ts-mode
  :ensure t
  :config (enzuru-configure-nix)
  :mode (("\\.nix\\'" . nix-ts-mode))
  :custom
  (nix-ts-mode-indent-offset 2))

(provide 'enzuru-nix)

;;; enzuru-nix.el ends here
