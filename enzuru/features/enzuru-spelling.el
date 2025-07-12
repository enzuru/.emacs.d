;;; enzuru-spelling.el --- Spell checking configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, spelling, aspell, flymake

;;; Commentary:

;; This module configures spell checking using Aspell and Flymake.

;;; Code:

;; Packages

(use-package flymake-aspell
  :ensure t
  :hook ((text-mode-hook . flymake-aspell-setup)))

(provide 'enzuru-spelling)

;;; enzuru-spelling.el ends here
