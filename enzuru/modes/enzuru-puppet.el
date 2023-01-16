;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-puppet
  :ensure t
  :hook ((puppet-mode . flymake-puppet-load)))

(use-package puppet-mode
  :ensure t
  :mode (("\\.pp$" . puppet-mode)))

(provide 'enzuru-puppet)
