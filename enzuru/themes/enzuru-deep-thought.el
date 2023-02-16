;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-deep-thought-theme ()
  (load-theme 'deep-thought t)
  (if (eq 'global-hl-line-mode 1) (set-face-background 'linum "#000F14"))
  (set-face-attribute 'fringe nil :background "#000F14" :foreground "#FFFFFF")
  (set-face-foreground 'mode-line-inactive "#888888")
  (set-face-background 'mode-line-inactive "#000F14")
  (set-face-background 'mode-line "#113450")
  (set-face-attribute 'vertical-border nil :foreground "#000F14")
  (sml/apply-theme 'respectful)
  (custom-set-faces
   '(mode-line ((t (:background "#001520" :foreground "#FFFFFF" :inverse-video nil :box nil :height 150))))
   '(mode-line-inactive ((t (:inherit mode-line :background "#001520" :foreground "gray40" :inverse-video nil :box nil :weight light))))))

;; Packages

(straight-use-package '(deep-thought-theme :type git :host github :repo "emacsfodder/emacs-deep-thought-theme"))
(enzuru-configure-deep-thought-theme)

(provide 'enzuru-deep-thought)
