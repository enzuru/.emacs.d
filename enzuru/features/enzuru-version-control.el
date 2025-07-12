;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package transient
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :bind (("C-c s" . magit-status)
         ("C-c p" . magit-push-current-to-upstream))
  :custom
  (vc-follow-symlinks t)
  :config
  (global-auto-revert-mode t))

(provide 'enzuru-version-control)
