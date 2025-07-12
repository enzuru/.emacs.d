;;; enzuru-php.el --- PHP programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, php

;;; Commentary:

;; Configuration for PHP programming.

;;; Code:

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

;;; enzuru-php.el ends here
