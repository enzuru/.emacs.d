;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-hyperbole ()
  (hyperb:init-menubar))

;; Packages

(use-package hyperbole
  :ensure t
  :config (enzuru-configure-hyperbole))

(provide 'enzuru-hyperlinking)
