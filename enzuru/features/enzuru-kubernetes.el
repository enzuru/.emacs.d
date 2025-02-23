;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package kubedoc
  :ensure t
  :defer t)

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :defer t)

(provide 'enzuru-kubernetes)
