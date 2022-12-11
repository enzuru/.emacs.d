;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-purple-haze-theme ()
  (load-theme 'purple-haze t)
  (set-face-background 'hl-line "#222222")
  (set-face-attribute 'fringe nil :background "#000000" :foreground "#FFFFFF")
  (set-face-attribute 'region nil :background "#666")
  (sml/apply-theme 'dark))

;; Packages

(straight-use-package '(purple-haze-theme :type git :host github :repo "emacsfodder/emacs-purple-haze-theme"))
(enzuru-configure-purple-haze-theme)

(provide 'enzuru-purple-haze)
