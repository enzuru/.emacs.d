;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (setq erc-nick "enzuru"
        erc-user-full-name "Ahmed Khanzada"
        erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477"))

  ;; (setq erc-autojoin-channels-alist
  ;;       '(("libera.chat" "#emacs" "#guix" "#guile" "#gnu")))

  (defun enzuru-load-irc ()
    (interactive)
    (erc :server "enzu.ru" :port "7000" :nick "enzuru/Libera" :password "enzuru/Libera:password")))

;; Packages

(use-package erc
  :ensure t
  :config (enzuru-configure-erc))

(provide 'enzuru-irc)
