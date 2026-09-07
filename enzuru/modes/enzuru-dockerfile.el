;;; enzuru-dockerfile.el --- Dockerfile configuration support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

;;(use-package docker
;;  :ensure t)

(use-package dockerfile-ts-mode
  :mode (("Dockerfile" . dockerfile-ts-mode)))

(provide 'enzuru-dockerfile)

;;; enzuru-dockerfile.el ends here
