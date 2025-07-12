;;; enzuru-search.el --- Code search configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, search, dumb-jump, xref

;;; Commentary:

;; This module configures code search and navigation tools including
;; Dumb Jump for finding definitions.

;;; Code:

;; Configuration

(defun enzuru-initialize-dumb-jump ()
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; Packages

(use-package dumb-jump
  :ensure t
  :defer t
  :custom
  (dumb-jump-force-searcher 'ag)
  (xref-show-definitions-function #'xref-show-definitions-completing-read)
  :init (enzuru-initialize-dumb-jump))

(provide 'enzuru-search)

;;; enzuru-search.el ends here
