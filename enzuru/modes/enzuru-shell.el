;;; enzuru-shell.el --- Shell configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: tools, shell

;;; Commentary:

;; Configuration for shell scripting and eshell.

;;; Code:

;; Functions

(defun enzuru-configure-em-smart ()
  (setq eshell-where-to-jump 'begin)
  (setq eshell-review-quick-commands nil)
  (setq eshell-smart-space-goes-to-end t))

(defun enzuru-configure-eshell ()
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq-local corfu-auto nil)
              (corfu-mode))))

;; Packages

(require 'em-smart)
(enzuru-configure-eshell)
(enzuru-configure-em-smart)

(provide 'enzuru-shell)

;;; enzuru-shell.el ends here
