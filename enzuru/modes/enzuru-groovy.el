;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package groovy-mode
  :ensure t
  :mode (("\\Jenkinsfile" . groovy-mode))
  :defer t)

(provide 'enzuru-groovy)
