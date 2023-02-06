;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-yaml-mode ()
  (setq yaml-indent-offset 2))

;; Packages

(use-package flymake-yamllint
  :ensure t
  :hook ((yaml-mode . flymake-yamllint-setup)))

(use-package yaml-mode
  :ensure t
  :defer t
  :config (enzuru-configure-yaml-mode))

(provide 'enzuru-yaml)
