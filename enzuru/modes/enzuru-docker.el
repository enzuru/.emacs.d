;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package docker
  :bind ("C-c d" . 'docker)
  :ensure t)

(use-package dockerfile-ts-mode
  :mode (("Dockerfile" . dockerfile-ts-mode))
  :ensure t)

(provide 'enzuru-docker)
