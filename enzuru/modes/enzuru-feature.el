;;; enzuru-feature.el --- Cucumber feature file support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, testing, cucumber, gherkin

;;; Commentary:

;; This module configures Cucumber feature file editing support
;; for behavior-driven development.

;;; Code:

;; Packages

(use-package feature-mode
  :ensure t
  :mode (("\\.behat\\'" . feature-mode-mode)))

(provide 'enzuru-feature)

;;; enzuru-feature.el ends here
