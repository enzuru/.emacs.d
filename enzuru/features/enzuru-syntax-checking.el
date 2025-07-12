;;; enzuru-syntax-checking.el --- Syntax checking configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, syntax, checking, flymake

;;; Commentary:

;; This module configures syntax checking using Flymake for real-time
;; error detection in code.

;;; Code:

;; Configuration

(defun enzuru-configure-flymake ()
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

;; Packages

(use-package flymake
  :ensure t
  :bind (("C-x n" . flymake-goto-next-error)
         ("C-x p" . flymake-goto-prev-error))
  :hook ((prog-mode . flymake-mode))
  :config (enzuru-configure-flymake))

(provide 'enzuru-syntax-checking)

;;; enzuru-syntax-checking.el ends here
