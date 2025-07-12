;;; enzuru-ruby.el --- Ruby programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, ruby

;;; Commentary:

;; Configuration for Ruby programming.

;;; Code:

;; Configuration

(defun enzuru-configure-ruby-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-ts-mode)))

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
  :hook ((ruby-ts-mode . robe-mode)
         (ruby-ts-mode . eglot-ensure))
  :bind (:map ruby-ts-mode-map (("C-c d" . robe-doc)))
  :defer t
  :diminish robe-mode
  :ensure t)

(use-package rvm
  :ensure t
  :defer t
  :config (enzuru-configure-rvm))

(use-package yard-mode
  :hook ((ruby-ts-mode . yard-mode))
  :defer t
  :diminish yard-mode
  :ensure t)

(enzuru-configure-ruby-ts-mode)

(provide 'enzuru-ruby)

;;; enzuru-ruby.el ends here
