;;; enzuru-rest.el --- REST client configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode))
  :bind ((:map restclient-mode-map
               ("C-c o" . restclient-http-send-current)))
  :defer t)

(provide 'enzuru-rest)

;;; enzuru-rest.el ends here
