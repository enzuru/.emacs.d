;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-swift-mode ()
  (setq swift-tab-width 4)
  (setq swift-indent-offset 4))

;; Packages

(use-package swift-mode
  :ensure t
  :defer t
  :config (enzuru-configure-swift-mode))

(provide 'enzuru-swift)
