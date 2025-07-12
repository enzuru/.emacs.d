;;; enzuru-kubernetes.el --- Kubernetes tools configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, kubernetes, containers

;;; Commentary:

;; This module configures Kubernetes development tools and documentation.

;;; Code:

;; Packages

(use-package kubedoc
  :ensure t
  :defer t)

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :defer t)

(provide 'enzuru-kubernetes)

;;; enzuru-kubernetes.el ends here
