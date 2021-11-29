;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-dumb-jump ()
  (setq dumb-jump-force-searcher 'ag))

(defun enzuru-configure-ivy-xref ()
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; Packages

(use-package dumb-jump
  :ensure t
  :config (enzuru-configure-dumb-jump))

(use-package ivy-xref
  :ensure t
  :config (enzuru-configure-ivy-xref))

(provide 'enzuru-search)
