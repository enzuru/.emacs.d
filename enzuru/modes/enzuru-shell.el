;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-company-shell ()
  (if (not (member 'company-shell company-backends))
      (push 'company-shell company-backends))
  (if (not (member 'company-shell-env company-backends))
      (push 'company-shell-env company-backends))
  (if (not (member 'company-fish-shell company-backends))
      (push 'company-fish-shell company-backends)))

;; Packages

(use-package company-shell
  :ensure t
  :hook ((shell-mode . enzuru-configure-company-shell)
         (fish-mode . enzuru-configure-company-shell)))

(provide 'enzuru-shell)
