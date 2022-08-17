;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (setq erc-nick "enzuru"
        erc-user-full-name "enzu.ru"
        erc-hide-list '("JOIN" "PART" "QUIT" "332" "333" "353" "324" "003" "329")
        erc-hide-timestamps t
        erc-track-visibility nil
        erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477")))

(defun enzuru-configure-znc ()
  (setq znc-detach-on-kill nil
        znc-servers
        '(
          ("enzu.ru" 7000 nil ((Libera "enzuru/Libera" "password")
                               (Sorcery "enzuru/Sorcery" "password")
                               (IRCnet "enzuru/IRCnet" "password")
                               (DarkMyst "enzuru/DarkMyst" "password")
                               (EFnet "enzuru/EFnet" "password")
                               (Darknet "enzuru/Darknet" "password")
                               (OFTC "enzuru/OFTC" "password"))))))

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
