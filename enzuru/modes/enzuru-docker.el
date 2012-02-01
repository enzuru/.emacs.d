;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package docker
  :bind ("C-c d" . 'docker)
  :ensure t)

(use-package docker-tramp
  :ensure t)

(use-package dockerfile-mode
  :mode (("Dockerfile" . dockerfile-mode))
  :ensure t)

(provide 'enzuru-docker)
