;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode))
  :bind ((:map restclient-mode-map
               ("C-c o" . restclient-http-send-current)))
  :defer t)

(provide 'enzuru-rest)
