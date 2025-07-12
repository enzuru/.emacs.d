;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-tide ()
  (tide-setup)
  (tide-hl-identifier-mode +1))


;; Packages

(use-package tide
  :ensure t
  :hook ((typescript-ts-mode . enzuru-configure-tide)))

(use-package typescript-ts-mode
  :defer t
  :custom
  (typescript-indent-level 2))

(provide 'enzuru-typescript)
