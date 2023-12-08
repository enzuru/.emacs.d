;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-tide ()
  (tide-setup)
  (tide-hl-identifier-mode +1))

(defun enzuru-configure-typescript-ts-mode ()
  (setq-default typescript-indent-level 2))

;; Packages

(use-package tide
  :ensure t
  :hook ((typescript-ts-mode . enzuru-configure-tide)))

(use-package typescript-ts-mode
  :ensure t
  :defer t
  :config (enzuru-configure-typescript-ts-mode))

(provide 'enzuru-typescript)
