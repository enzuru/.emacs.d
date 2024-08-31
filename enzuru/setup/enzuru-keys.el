;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-volatile-kill-buffer ()
  "Kill current buffer unconditionally."
  (interactive)
  (let ((buffer-modified-p nil))
    (kill-buffer (current-buffer))))

;; Help

(global-set-key (kbd "C-c k") 'enzuru-volatile-kill-buffer)
(global-set-key (kbd "C-c o") 'compile)
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c t") 'tab-bar-select-tab-by-name)
(global-set-key (kbd "C-c b") 'consult-buffer)
(global-set-key (kbd "C-c i") 'describe-symbol)

(global-set-key (kbd "C-c <left>") 'previous-buffer)
(global-set-key (kbd "C-c <right>") 'next-buffer)
(global-set-key (kbd "C-c <up>") 'beginning-of-buffer)
(global-set-key (kbd "C-c <down>") 'end-of-buffer)

(provide 'enzuru-keys)
