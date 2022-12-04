;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-php-mode ()
  (setq php-mode-force-pear 1))

;; Packages

(use-package company-php
  :ensure t
  :defer t)

(use-package flycheck-php-noverify
  :ensure t
  :defer t)

(use-package php-mode
  :ensure t
  :mode (("\.php$" . php-mode))
  :config (enzuru-configure-php-mode))

(provide 'enzuru-php)
