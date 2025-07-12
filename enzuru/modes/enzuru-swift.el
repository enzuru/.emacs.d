;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration


;; Packages

(use-package swift-mode
  :ensure t
  :defer t
  :custom
  (swift-tab-width 4)
  (swift-indent-offset 4))

(provide 'enzuru-swift)
