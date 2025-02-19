;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-mu ()
  (autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
  (add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on))

;; Packages

(use-package mu
  :ensure (:host github :repo "kensanata/mu"))

(provide 'enzuru-gaming)
