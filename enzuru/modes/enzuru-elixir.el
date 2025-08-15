;;; enzuru-elixir.el --- Elixir programming language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, elixir, programming, functional

;;; Commentary:

;; This module configures Elixir programming language support with
;; Alchemist and Tree-sitter for enhanced development experience.

;;; Code:

;; Packages

(use-package alchemist
  :ensure t
  :defer t)

(use-package elixir-ts-mode
  :ensure t
  :defer t
  :hook ((elixir-ts-mode . eglot-ensure)))

(use-package inf-elixir
  :ensure t
  :defer t
  ;; :bind (("C-c i i" . 'inf-elixir)
  ;;        ("C-c i p" . 'inf-elixir-project)
  ;;        ("C-c i l" . 'inf-elixir-send-line)
  ;;        ("C-c i r" . 'inf-elixir-send-region)
  ;;        ("C-c i b" . 'inf-elixir-send-buffer)
  ;;        ("C-c i R" . 'inf-elixir-reload-module))
  )

(provide 'enzuru-elixir)

;;; enzuru-elixir.el ends here
