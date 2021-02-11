(require 'notmuch)

(setq mail-user-agent 'message-user-agent)
(setq user-mail-address "me@enzu.ru"
      user-full-name "Ahmed Khanzada")
(setq smtpmail-smtp-server "smtp.gmail.com"
      message-send-mail-function 'message-smtpmail-send-it)
(setq smtpmail-debug-info t)
(setq message-default-mail-headers "Cc: \nBcc: \n")
(setq message-auto-save-directory "~/mail/draft")
(setq message-kill-buffer-on-exit t)
(setq message-directory "~/mail/")
(setq notmuch-search-oldest-first nil)
(setq fill-column 72)

(add-hook 'message-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'refill-mode)
