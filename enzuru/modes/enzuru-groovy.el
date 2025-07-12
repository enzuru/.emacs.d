;;; enzuru-groovy.el --- Groovy programming language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, groovy, jvm, programming

;;; Commentary:

;; This module configures Groovy programming language support including
;; Jenkins pipeline scripts.

;;; Code:

;; Packages

(use-package groovy-mode
  :ensure t
  :mode (("\\Jenkinsfile" . groovy-mode))
  :defer t)

(provide 'enzuru-groovy)

;;; enzuru-groovy.el ends here
