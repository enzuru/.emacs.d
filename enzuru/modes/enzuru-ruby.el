;;; enzuru-ruby.el --- Ruby programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

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

(use-package ruby-ts-mode
  :defer t
  :hook ((ruby-ts-mode . eglot-ensure)))

(use-package ruby-end
  :ensure t
  :custom ((ruby-end-insert-newline nil))
  :hook (ruby-ts-mode . ruby-end-mode))

(provide 'enzuru-ruby)

;;; enzuru-ruby.el ends here
