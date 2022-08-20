;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-tab-bar-mode ()
  (tab-bar-mode)
  (define-prefix-command 'tab-map)
  (global-set-key (kbd "C-z") 'tab-map)
  (global-set-key (kbd "C-z c") 'tab-bar-new-tab)
  (global-set-key (kbd "C-z n") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z p") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z k") 'tab-bar-close-tab)
  (global-set-key (kbd "C-x C-n") 'tab-bar-select-tab-by-name))

(defun enzuru-configure-winner-mode ()
  (winner-mode 1))

;; Packages

(enzuru-configure-tab-bar-mode)
(enzuru-configure-winner-mode)

(provide 'enzuru-frames)
