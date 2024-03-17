;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-php-mode ()
  (setq php-mode-force-pear 1))

;; Packages

(use-package php-mode
  :ensure t
  :mode (("\.php$" . php-mode))
  :config (enzuru-configure-php-mode))

(use-package psysh
  :ensure t
  :defer t)

(provide 'enzuru-php)
