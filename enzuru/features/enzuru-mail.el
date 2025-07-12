;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package gnus
  :custom
  (gnus-search-default-engines '(notmuch))
  (gnus-select-method '(nnmaildir "maildir"
                                  (directory "~/mail/me")
                                  (get-new-mail nil)
                                  (gnus-search-engine gnus-search-notmuch
                                                      (remove-prefix "/home/enzuru/mail/me/")
                                                      (config-file "/home/enzuru/.notmuch-config"))))
  (gnus-secondary-select-methods '((nntp "lore.kernel.org"
                                         (nntp-address "nntp.lore.kernel.org"))))
  (gnus-large-newsgroup 1000)
  (gnus-large-ephemeral-newsgroup 1000)
  (gnus-show-threads t)
  (gnus-thread-indent-level 1)
  (gnus-thread-hide-subtree t)
  (gnus-search-use-parsed-queries t)
  (gnus-verbose 10)
  (gnus-verbose-backends 10)
  (gnus-always-read-dribble-file t)
  (fill-column 72)
  (mail-user-agent 'message-user-agent)
  (message-auto-save-directory "~/mail/draft")
  (message-default-mail-headers "Cc: \nBcc: \n")
  (message-directory "~/mail/")
  (message-kill-buffer-on-exit t)
  (message-send-mail-function 'message-smtpmail-send-it)
  (send-mail-function 'smtpmail-send-it)
  (smtpmail-smtp-server "smtp.fastmail.com")
  (smtpmail-smtp-service 587)
  (user-mail-address "me@enzu.ru")
  (user-full-name "Ahmed Khanzada")
  :config
  (gnus-add-configuration '(article (horizontal 1.0 (summary .5 point) (article 1.0)))))

(use-package notmuch
  :ensure t
  :defer t
  :custom
  (notmuch-search-oldest-first nil)
  (notmuch-draft-save-plaintext nil))

(provide 'enzuru-mail)
