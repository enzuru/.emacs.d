;;; enzuru-hyperlinking.el --- Hyperbole hyperlinking system -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, hypermedia, hyperbole, linking

;;; Commentary:

;; This module configures the Hyperbole hypermedia system for
;; advanced linking and action capabilities.

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
