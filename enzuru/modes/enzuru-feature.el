;;; enzuru-feature.el --- Cucumber feature file support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package feature-mode
  :ensure t
  :mode (("\\.behat\\'" . feature-mode-mode)))

(provide 'enzuru-feature)

;;; enzuru-feature.el ends here
