;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package puppet-mode
  :ensure t
  :mode (("\\.pp$" . puppet-mode)))

(provide 'enzuru-puppet)
