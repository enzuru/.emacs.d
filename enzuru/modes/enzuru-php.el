;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-php-mode ()
  (setq php-mode-force-pear 1))

;; Packages

(use-package flycheck-php-noverify
  :ensure t)

(use-package php-mode
  :ensure t
  :mode (("\.php$" . php-mode))
  :config (enzuru-configure-php-mode))

(provide 'enzuru-php)
