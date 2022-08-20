;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-omtose-theme ()
  (load-theme 'omtose-darker t)
  (set-face-background 'hl-line "#301934")
  (sml/apply-theme 'respectful))

;; Packages

(use-package omtose-phellack-theme
  :load-path "local/omtose-phellack-theme"
  :config (enzuru-configure-omtose-theme))

(provide 'enzuru-omtose-darker)
