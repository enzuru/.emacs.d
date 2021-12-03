;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (setq erc-nick "enzuru"
        erc-user-full-name "Ahmed Khanzada")

  (setq erc-autojoin-channels-alist
        '(("libera.chat" "#emacs" "#guix" "#guile" "#gnu")))

  (defun enzuru-load-irc ()
    (interactive)
    (erc-tls :server "irc.libera.chat" :port "6697" :password "password")))

;; Packages

(use-package erc
  :ensure t
  :config (enzuru-configure-erc))

(provide 'enzuru-irc)
