;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-notmuch ()
  (setq fill-column 72
        mail-user-agent 'message-user-agent
        message-auto-save-directory "~/mail/draft"
        message-default-mail-headers "Cc: \nBcc: \n"
        message-directory "~/mail/"
        message-kill-buffer-on-exit t
        message-send-mail-function 'message-smtpmail-send-it
        notmuch-search-oldest-first nil
        notmuch-draft-save-plaintext nil
        send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "mail.enzu.ru"
        smtpmail-smtp-service 587
        user-mail-address "me@enzu.ru"
        user-full-name "Ahmed Khanzada"))

;; Packages

(use-package notmuch
  :ensure t
  :config (enzuru-configure-notmuch))

(provide 'enzuru-mail)
