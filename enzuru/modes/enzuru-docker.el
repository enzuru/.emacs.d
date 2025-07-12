;;; enzuru-docker.el --- Docker configuration support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, docker, containers

;;; Commentary:

;; This module configures Docker file editing support with Tree-sitter
;; for Dockerfile syntax highlighting and editing.

;;; Code:

;; Packages

;;(use-package docker
;;  :ensure t)

(use-package dockerfile-ts-mode
  :mode (("Dockerfile" . dockerfile-ts-mode)))

(provide 'enzuru-docker)

;;; enzuru-docker.el ends here
