;;; enzuru-kotlin.el --- Kotlin programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, kotlin

;;; Commentary:

;; Configuration for Kotlin programming.

;;; Code:

;; Configuration


;; Packages

(use-package kotlin-mode
  :ensure t
  :custom
  (kotlin-tab-width 4))

(provide 'enzuru-kotlin)

;;; enzuru-kotlin.el ends here
