;;; enzuru-gotham.el --- Gotham theme configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-gotham-theme ()
  (load-theme 'gotham t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package gotham-theme
  :ensure t
  :config (enzuru-configure-gotham-theme))

(provide 'enzuru-gotham)

;;; enzuru-gotham.el ends here
