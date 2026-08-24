;;; enzuru-kusanagi.el --- Kusanagi theme configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-kusanagi-theme ()
  (load-theme 'kusanagi t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package kusanagi-theme
  :ensure t
  :config (enzuru-configure-kusanagi-theme))

(provide 'enzuru-kusanagi)

;;; enzuru-kusanagi.el ends here
