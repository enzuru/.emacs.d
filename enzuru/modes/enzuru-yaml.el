;;; enzuru-yaml.el --- YAML configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, yaml

;;; Commentary:

;; Configuration for YAML files.

;;; Code:

;; Configuration


;; Packages

(use-package yaml-mode
  :ensure t
  :defer t
  :custom
  (yaml-indent-offset 2))

(provide 'enzuru-yaml)

;;; enzuru-yaml.el ends here
