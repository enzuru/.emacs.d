;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package clipetty
  :ensure t
  :diminish clipetty-mode
  :hook (after-init . global-clipetty-mode))

(provide 'enzuru-clipboard)
