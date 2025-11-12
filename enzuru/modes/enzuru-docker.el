;;; enzuru-docker.el --- Docker configuration support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

;;(use-package docker
;;  :ensure t)

(use-package dockerfile-ts-mode
  :mode (("Dockerfile" . dockerfile-ts-mode)))

(provide 'enzuru-docker)

;;; enzuru-docker.el ends here
