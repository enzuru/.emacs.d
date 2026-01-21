;;; enzuru-overlay.el --- Overlay display configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package eros
  :ensure t
  :config (eros-mode 1))

(use-package flyover
  :ensure (:host github :repo "konrad1977/flyover")
  :hook ((flymake-mode . flyover-mode))
  :diminish (flyover-mode)
  :custom
  (flyover-levels '(error warning info))
  (flyover-checkers '(flymake))
  (flyover-border-style 'pill)
  (flyover-info-icon "🛈")
  (flyover-warning-icon "⚠")
  (flyover-error-icon "✘")
  (flyover-background-lightness 25)
  (flyover-levels '(error warning info))
  (flyover-use-theme-colors t))

(provide 'enzuru-overlay)

;;; enzuru-overlay.el ends here
