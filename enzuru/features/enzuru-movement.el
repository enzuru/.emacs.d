;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-windmove ()
  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings)))

;; Packages

(enzuru-configure-windmove)

(provide 'enzuru-movement)
