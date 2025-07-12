;;; enzuru-rest.el --- REST client configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, http, rest, api

;;; Commentary:

;; This module configures REST client tools for testing HTTP APIs.

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
