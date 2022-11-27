;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-mu ()
  (straight-use-package '(mu :type git :host github :repo "kensanata/mu"))
  (require 'mu)
  (autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
  (add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on))

;; Packages

(enzuru-load-mu)

(provide 'enzuru-gaming)
