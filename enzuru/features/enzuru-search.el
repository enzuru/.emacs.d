;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-dumb-jump ()
  (setq dumb-jump-force-searcher 'ag))

;; Packages

(use-package dumb-jump
  :ensure t
  :config (enzuru-configure-dumb-jump))

(provide 'enzuru-search)
