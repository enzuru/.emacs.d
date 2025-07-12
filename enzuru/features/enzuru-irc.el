;;; enzuru-irc.el --- IRC client configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: comm, irc

;;; Commentary:

;; This file configures IRC client functionality using ERC.
;; It provides configuration for connecting to multiple networks via ZNC.

;;; Code:

;; Configuration

(defun enzuru-configure-erc ()
  (add-to-list 'erc-modules 'completion)
  (let ((in-channels '())
        (total-channels 13))
    (defun enzuru-channel-push ()
      (cl-pushnew (buffer-name (current-buffer)) in-channels)
      (message (number-to-string (- total-channels (length in-channels))))
      (if (eql (length in-channels) total-channels)
          (enzuru-arrange-chats)))

    (defun enzuru-channel-remove (buffer)
      (cl-remove (buffer-name buffer) in-channels))

    (add-hook 'erc-join-hook 'enzuru-channel-push)
    (add-hook 'erc-part-hook 'enzuru-channel-remove)))

;; Packages

(use-package erc
  :ensure t
  :custom
  (erc-nick "enzuru")
  (erc-user-full-name "enzu.ru")
  (erc-hide-list '("JOIN" "PART" "QUIT" "332" "333" "353" "324" "003" "329" "301" "305" "306"))
  (erc-hide-timestamps t)
  (erc-track-position-in-mode-line nil)
  (erc-join-buffer 'bury)
  (erc-track-minor-mode nil)
  (erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477"))
  :config (enzuru-configure-erc))

(use-package erc-hl-nicks
  :ensure t
  :after erc
  :config (add-to-list 'erc-modules 'hl-nicks))

(use-package znc
  :ensure t
  :after erc
  :custom
  (znc-detach-on-kill nil)
  (znc-servers '(("enzuru.znchost.com" 4000 t ((Libera "enzuru/liberachat" "password")
                                                (OFTC "enzuru/oftc" "password")
                                                (Tilde "enzuru/tilde" "password"))))))

(provide 'enzuru-irc)

;;; enzuru-irc.el ends here
