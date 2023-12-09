;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-initialize-dumb-jump ()
  (setq dumb-jump-force-searcher 'ag)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  (global-set-key (kbd "C-x C-w") 'dumb-jump-go))

;; Packages

(use-package dumb-jump
  :ensure t
  :defer t
  :init (enzuru-initialize-dumb-jump))

(provide 'enzuru-search)
