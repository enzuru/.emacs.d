;;; enzuru-frames.el --- Frame and window preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, frames, windows

;;; Commentary:

;; Configuration for frame and window management preferences.

;;; Code:

;; Configuration

(defun enzuru-configure-tab-bar-mode ()
  (tab-bar-mode)
  (define-prefix-command 'tab-map)
  (global-set-key (kbd "C-z") 'tab-map)
  (global-set-key (kbd "C-z c") 'tab-bar-new-tab)
  (global-set-key (kbd "C-z n") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z p") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z k") 'tab-bar-close-tab))

(defun enzuru-configure-winner-mode ()
  (winner-mode 1))

;; Packages

;; (enzuru-load-counsel-tabs)
(enzuru-configure-tab-bar-mode)
(enzuru-configure-winner-mode)

(provide 'enzuru-frames)

;;; enzuru-frames.el ends here
