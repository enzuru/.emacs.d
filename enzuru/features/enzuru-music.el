;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-pianobar ()
  (setq pianobar-username "lenzuru@gmail.com"
        pianobar-password "password"
        pianobar-station "0"))

;; Packages

(use-package pianobar
  :ensure t
  :config (enzuru-configure-pianobar))

(provide 'enzuru-music)
