;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-shell ()
  (cl-pushnew 'company-shell company-backends)
  (cl-pushnew 'company-shell-env company-backends)
  (cl-pushnew 'company-fish-shell company-backends))

;; Packages

(use-package company-shell
  :ensure t
  :hook ((shell-mode . enzuru-configure-company-shell)
         (fish-mode . enzuru-configure-company-shell)))

(provide 'enzuru-shell)
