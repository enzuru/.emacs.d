;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-projectile ()
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

;; Packages

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (enzuru-configure-projectile))

(provide 'enzuru-project-management)
