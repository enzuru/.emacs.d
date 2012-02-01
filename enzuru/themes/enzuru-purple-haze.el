;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-purple-haze-theme ()
  (load-theme 'purple-haze t)

  (set-face-background 'hl-line "#222222")
  (set-face-attribute 'fringe nil :background "#000000" :foreground "#FFFFFF")
  (set-face-attribute 'region nil :background "#666")
  (set-face-attribute 'default nil
                      :family "Liberation Mono" :height 120 :weight 'normal)

  (sml/apply-theme 'dark))

;; Packages

(use-package purple-haze-theme
  :load-path "local/purple-haze-theme"
  :config (enzuru-configure-purple-haze-theme))

(provide 'enzuru-purple-haze)
