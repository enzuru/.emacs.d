;;; enzuru-kubernetes.el --- Kubernetes tools configuration -*- coding: utf-8; lexical-binding: t -*-

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
