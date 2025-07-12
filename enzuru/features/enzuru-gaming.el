;;; enzuru-gaming.el --- Gaming and MUD/MUSH configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: games, mud, mush, gnugo

;;; Commentary:

;; This module configures gaming packages including GNU Go and MU for
;; connecting to MUDs and MUSHes.

;;; Code:

;; Functions

(defun enzuru-configure-gnugo ()
  (add-hook 'gnugo-start-game-hook (lambda () (gnugo-image-display-mode))))

(defun enzuru-load-mu ()
  (autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
  (add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on))

;; Packages

(use-package mu
  :ensure (:host github :repo "kensanata/mu")
  :defer t)

(use-package gnugo
  :ensure (:host github :repo "emacsmirror/gnugo" :branch "master")
  :defer t
  :config (enzuru-configure-gnugo)
  :custom
  (gnugo-xpms (gnugo-imgen-create-xpms 19)))

(provide 'enzuru-gaming)

;;; enzuru-gaming.el ends here
