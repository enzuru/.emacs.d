;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-magit ()
  (setq vc-follow-symlinks t)
  (global-auto-revert-mode t))

;; Packages

(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :bind (("C-c s" . magit-status)
         ("C-c C-p" . magit-push-current-to-upstream))
  :config (enzuru-configure-magit))

(provide 'enzuru-version-control)
