;;; enzuru-documentation.el --- Documentation tools configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, documentation, devdocs

;;; Commentary:

;; This module configures documentation tools like DevDocs for easy
;; access to programming documentation.

;;; Code:

;; Packages

(use-package devdocs
  :ensure t
  :bind (("C-c d" . devdocs-search)))

(provide 'enzuru-documentation)

;;; enzuru-documentation.el ends here
