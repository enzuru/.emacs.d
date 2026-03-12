;;; enzuru-nix.el --- Nix configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-nix ()
  (add-hook 'find-file-hook
  (lambda ()
    (when (string= (buffer-name) "configuration.nix")
      (set (make-local-variable 'compile-command) "sudo nixos-rebuild switch --flake .")))))

;; Packages

(use-package nix-mode
  :ensure t
  :config (enzuru-configure-nix)
  :mode (("\.nix$" . nix-mode)))

(provide 'enzuru-nix)

;;; enzuru-nix.el ends here
