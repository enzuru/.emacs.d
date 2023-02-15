;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-inf-ruby ()
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(defun enzuru-configure-rvm ()
  (rvm-use-default))

;; Packages

(use-package inf-ruby
  :ensure t
  :defer t
  :config (enzuru-configure-inf-ruby))

(use-package robe
  :hook ((ruby-mode . robe-mode)
         (ruby-mode . eglot-ensure))
  :defer t
  :diminish robe-mode
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
