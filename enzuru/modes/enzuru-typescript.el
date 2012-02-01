;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-typescript-mode ()
  (setq-default typescript-indent-level 2))

;; Packages

(use-package typescript-mode
  :ensure t
  :config (enzuru-configure-typescript-mode))

(provide 'enzuru-typescript)
