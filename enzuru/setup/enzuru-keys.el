;; -*- coding: utf-8; lexical-binding: t -*-

;; Help

(global-set-key (kbd "C-c k") 'enzuru-volatile-kill-buffer)
(global-set-key (kbd "C-c o") 'compile)
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c t") 'tab-bar-select-tab-by-name)
(global-set-key (kbd "C-c b") 'describe-symbol)

(global-set-key (kbd "C-c <left>") 'previous-buffer)
(global-set-key (kbd "C-c <right>") 'next-buffer)
(global-set-key (kbd "C-c <up>") 'beginning-of-buffer)
(global-set-key (kbd "C-c <down>") 'end-of-buffer)

(provide 'enzuru-keys)
