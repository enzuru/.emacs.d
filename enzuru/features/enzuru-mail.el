;;;  setup the mail address and use name
(setq mail-user-agent 'message-user-agent)
(setq user-mail-address "me@enzu.ru"
      user-full-name "Ahmed Khanzada")

;; smtp config
(setq smtpmail-smtp-server "smtp.gmail.com"
      message-send-mail-function 'message-smtpmail-send-it)

;; report problems with the smtp server
(setq smtpmail-debug-info t)

;; add Cc and Bcc headers to the message buffer
(setq message-default-mail-headers "Cc: \nBcc: \n")

;; postponed message is put in the following draft directory
(setq message-auto-save-directory "~/mail/draft")
(setq message-kill-buffer-on-exit t)

;;  change the idrectory 
(setq message-directory "~/mail/")

(add-to-list 'load-path "~/src/notmuch/emacs")
(require 'notmuch)

(setq notmuch-search-oldest-first nil)

(setq fill-column 72)
(add-hook 'message-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'refill-mode)
