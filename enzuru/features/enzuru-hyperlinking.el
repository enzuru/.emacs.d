;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-hyperbole ()
  (require 'hyperbole)
  (hyperb:init-menubar))

;; Packages

(use-package hyperbole
  :ensure t
  :diminish hyperbole-mode
  :mode (("\\.hypb$" . lisp-mode)
         ("\\.org$" . org-mode))
  :config (enzuru-configure-hyperbole))

(enzuru-configure-hyperbole)

(provide 'enzuru-hyperlinking)
