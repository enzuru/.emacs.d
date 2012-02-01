;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (setq erc-nick "enzuru"
        erc-user-full-name "Ahmed Khanzada")

  (setq erc-autojoin-channels-alist
        '(("libera.chat" "#emacs" "#guix" "#openbsd" "#lisp" "#guile" "#gnu")
          ("oftc.net" "#cat-v")
          ("sorcery.net" "#square")
          ("psychz.net" "#c-64")))

  (defun enzuru-load-irc ()
    (interactive)
    (erc-tls :server "irc.libera.chat" :port "6697" :password "password")
    (erc-tls :server "irc.oftc.net" :port "6697" :password "password")
    (erc-tls :server "themis.sorcery.net" :port "6697" :password "password")
    (erc-tls :server "psychz.ssl.ircnet.ovh" :port "6697" :password "password")))

;; Packages

(use-package erc
  :ensure t
  :config (enzuru-configure-erc))

(provide 'enzuru-irc)
