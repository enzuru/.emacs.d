;;; enzuru-timu-macos.el --- Timu macOS theme configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-timu-macos-theme ()
  (load-theme 'timu-macos t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package timu-macos-theme
  :ensure t
  :config (enzuru-configure-timu-macos-theme))

(provide 'enzuru-timu-macos)

;;; enzuru-timu-macos.el ends here
