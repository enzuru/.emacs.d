;;; enzuru-go.el --- Go programming language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, go, golang, programming

;;; Commentary:

;; This module configures Go programming language support with Tree-sitter
;; and playground integration.

;;; Code:

;; Packages

(use-package go-ts-mode
  :defer t
  :bind (:map go-ts-mode-map (("C-c d" . godoc-at-point)))
  :hook ((go-ts-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)

;;; enzuru-go.el ends here
