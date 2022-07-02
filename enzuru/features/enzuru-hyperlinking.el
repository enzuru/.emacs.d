;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-hyperbole ()
  (interactive)
  (hyperb:init))

;; Packages

(use-package hyperbole
  :ensure t
  :mode (("\\.hypb$" . lisp-mode)
         ("\\.org$" . org-mode))
  :config (enzuru-configure-hyperbole))

(provide 'enzuru-hyperlinking)
