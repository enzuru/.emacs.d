;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-swift-mode ()
  (setq swift-tab-width 4)
  (setq swift-indent-offset 4)
  (add-hook 'swift-mode-hook 'flycheck-mode))

;; Packages

(use-package flycheck-swift3
  :ensure t)

(use-package swift-mode
  :ensure t
  :config (enzuru-configure-swift-mode))

(provide 'enzuru-swift)
