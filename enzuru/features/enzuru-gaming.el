;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-mu ()
  (add-to-list 'load-path "~/.emacs.d/local/mu")
  (require 'mu)
  (autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
  (add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on))

;; Packages

(enzuru-load-mu)

(provide 'enzuru-gaming)
