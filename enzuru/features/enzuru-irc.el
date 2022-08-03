;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (setq erc-nick "enzuru"
        erc-user-full-name "enzu.ru"
        erc-hide-list '("JOIN" "PART" "QUIT")
        erc-track-visibility nil
        erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477"))

  (defun enzuru-load-irc ()
    (interactive)
    (setq erc-autojoin-channels-alist
          '(("libera.chat" "#emacs" "#guix" "#guile" "#gnu")))
    (erc :server "enzu.ru" :port "7000" :nick "enzuru/Libera" :password "enzuru/Libera:password")))

(defun enzuru-configure-znc ()
  (setq znc-servers
        '(("enzu.ru" 7000 nil
           ((Libera "enzuru" "password"))))))

;; Packages

(use-package erc
  :ensure t
  :config (enzuru-configure-erc))

(use-package erc-hl-nicks
  :ensure t
  :after erc
  :config (add-to-list 'erc-modules 'hl-nicks))

(use-package znc
  :ensure t
  :config (enzuru-configure-znc))

(provide 'enzuru-irc)
