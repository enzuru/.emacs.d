;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-gnugo ()
  (setf gnugo-xpms (gnugo-imgen-create-xpms 19))
  (add-hook 'gnugo-start-game-hook (lambda () (gnugo-image-display-mode))))

(defun enzuru-load-mu ()
  (autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
  (add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on))

;; Packages

(use-package mu
  :ensure (:host github :repo "kensanata/mu"))

(use-package gnugo
  :config (enzuru-configure-gnugo)
  :ensure (:host github :repo "emacsmirror/gnugo" :branch "master"))

(provide 'enzuru-gaming)
