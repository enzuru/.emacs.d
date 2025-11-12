;;; enzuru-molokai.el --- Molokai theme configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-molokai-theme ()
  (load-theme 'molokai t)
  (sml/apply-theme 'dark))

;; Packages

(use-package molokai-theme
  :ensure t
  :config (enzuru-configure-molokai-theme))

(provide 'enzuru-molokai)

;;; enzuru-molokai.el ends here
