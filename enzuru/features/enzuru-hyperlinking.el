;;; enzuru-hyperlinking.el --- Hyperbole hyperlinking system -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

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

(provide 'enzuru-hyperlinking)

;;; enzuru-hyperlinking.el ends here
