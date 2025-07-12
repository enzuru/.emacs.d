;;; enzuru-vala.el --- Vala programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, vala

;;; Commentary:

;; Configuration for Vala programming.

;;; Code:

;; Packages

(use-package vala-mode
  :ensure t
  :mode (("\.vala$" . vala-mode)))

(provide 'enzuru-vala)

;;; enzuru-vala.el ends here
