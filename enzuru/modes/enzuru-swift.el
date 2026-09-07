;;; enzuru-swift.el --- Swift programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration


;; Packages

(use-package swift-ts-mode
  :ensure t
  :defer t
  :mode (("\\.swift\\'" . swift-ts-mode))
  :custom
  (swift-ts-mode-indent-offset 4))

(provide 'enzuru-swift)

;;; enzuru-swift.el ends here
