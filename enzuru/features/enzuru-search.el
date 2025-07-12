;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-initialize-dumb-jump ()
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; Packages

(use-package dumb-jump
  :ensure t
  :defer t
  :custom
  (dumb-jump-force-searcher 'ag)
  (xref-show-definitions-function #'xref-show-definitions-completing-read)
  :init (enzuru-initialize-dumb-jump))

(provide 'enzuru-search)
