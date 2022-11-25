;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-hyperbole ()
  (hyperb:init-menubar))

;; Packages

(use-package hyperbole
  :ensure t
  :mode (("\\.hypb$" . lisp-mode)
         ("\\.org$" . org-mode))
  :config (enzuru-configure-hyperbole))

(enzuru-configure-hyperbole)

(provide 'enzuru-hyperlinking)
