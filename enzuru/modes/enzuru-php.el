;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions


;; Packages

(use-package php-mode
  :ensure t
  :mode (("\.php$" . php-mode))
  :custom
  (php-mode-force-pear 1))

(use-package psysh
  :ensure t
  :defer t)

(provide 'enzuru-php)
