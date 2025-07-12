;;; enzuru-deep-thought.el --- Deep Thought theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Deep Thought color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-deep-thought-theme ()
  (load-theme 'deep-thought t)
  (sml/apply-theme 'respectful)
  (set-face-attribute 'fringe nil :background "#000F14" :foreground "#FFFFFF")
  (set-face-attribute 'vertical-border nil :foreground "#000F14")
  (custom-set-faces
   '(mode-line ((t (:background "#001520" :foreground "#FFFFFF" ))))
   '(mode-line-inactive ((t (:inherit mode-line :background "#001520" :foreground "gray40")))))
  )

;; Packages

(use-package deep-thought-theme
  :ensure t (:host github :repo "enzuru/emacs-deep-thought-theme")
  :config (enzuru-configure-deep-thought-theme))

(provide 'enzuru-deep-thought)

;;; enzuru-deep-thought.el ends here
