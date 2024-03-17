;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode))
  :bind ((:map restclient-mode-map
               ("C-x c" . restclient-http-send-current)))
  :defer t)

(provide 'enzuru-rest)
