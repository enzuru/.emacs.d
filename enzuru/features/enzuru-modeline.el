;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-sml ()
  (setq sml/mode-width 'full)
  (setq sml/name-width 20)
  (setq sml/shorten-modes 't)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; Packages

(use-package smart-mode-line
  :ensure t
  :config (enzuru-configure-sml))

;; Variables

(column-number-mode t)

(provide 'enzuru-modeline)
