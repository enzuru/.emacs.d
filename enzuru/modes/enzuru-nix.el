;;; enzuru-nix.el --- Nix configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, nix

;;; Commentary:

;; Configuration for Nix package manager and NixOS.

;;; Code:

;; Packages

(use-package nix-mode
  :ensure t
  :mode (("\.nix$" . nix-mode)))

(provide 'enzuru-nix)

;;; enzuru-nix.el ends here
