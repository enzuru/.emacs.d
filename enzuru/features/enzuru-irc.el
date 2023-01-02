;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-erc ()
  (add-to-list 'erc-modules 'completion)

  (let ((count 0))
    (defun enzuru-incf-enzuru-irc-channels-count ()
      (cl-incf count)
      (if (equal count 30)
          (enzuru-arrange-tabs)))
    (add-hook 'erc-join-hook 'enzuru-incf-enzuru-irc-channels-count))

  (setq erc-nick "enzuru"
        erc-user-full-name "enzu.ru"
        erc-hide-list '("JOIN" "PART" "QUIT" "332" "333" "353" "324" "003" "329" "301" "305" "306")
        erc-hide-timestamps t
        erc-track-visibility nil
        erc-join-buffer 'bury
        erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477")))

(defun enzuru-configure-znc ()
  (setq znc-detach-on-kill nil
        znc-servers
        '(
          ("enzu.ru" 7001 t ((darkscience "enzuru/darkscience" "password")
                             (Libera "enzuru/Libera" "password")
                             (OFTC "enzuru/OFTC" "password")
                             (IRCnet "enzuru/IRCnet" "password")
                             (DarkMyst "enzuru/DarkMyst" "password"))))))

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
  :after erc
  :config (enzuru-configure-znc))

(provide 'enzuru-irc)
