;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-inf-ruby ()
  (if (not (member 'company-inf-ruby company-backends))
      (push 'company-inf-ruby company-backends)))

(defun enzuru-configure-inf-ruby ()
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(defun enzuru-configure-rvm ()
  (rvm-use-default))

;; Packages

(use-package company-inf-ruby
  :ensure t
  :hook ((ruby-mode . enzuru-configure-company-inf-ruby)))

(use-package inf-ruby
  :ensure t
  :defer t
  :config (enzuru-configure-inf-ruby))

(use-package projectile-rails
  :defer t
  :ensure t)

(use-package robe
  :hook ((ruby-mode . robe-mode)
         (ruby-mode . eglot-ensure))
  :defer t
  :diminish robe-mode
  :ensure t)

(use-package ruby-refactor
  :diminish ruby-refactor-mode
  :defer t
  :hook ((ruby-mode. ruby-refactor-mode-launch))
  :ensure t)

(use-package rvm
  :ensure t
  :defer t
  :config (enzuru-configure-rvm))

(use-package yard-mode
  :hook ((ruby-mode . yard-mode))
  :defer t
  :diminish yard-mode
  :ensure t)

(provide 'enzuru-ruby)
