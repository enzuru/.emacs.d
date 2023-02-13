;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-counsel-projectile ()
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (counsel-projectile-mode))

(defun enzuru-configure-projectile ()
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

;; Packages

(use-package counsel-projectile
  :ensure t
  :defer t
  :after (projectile)
  :config (enzuru-configure-counsel-projectile))

(use-package projectile
  :ensure t
  :defer t
  :diminish projectile-mode
  :config (enzuru-configure-projectile))

(provide 'enzuru-project-management)
