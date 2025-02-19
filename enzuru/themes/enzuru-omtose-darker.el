;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-omtose-theme ()
  (load-theme 'omtose-darker t)
  (set-face-background 'hl-line "#301934")
  (sml/apply-theme 'respectful)
  (set-face-background 'hl-line "#000000"))

;; Packages

(use-package omtose-phellack-theme
  :ensure (:host github :repo "franksn/omtose-phellack-theme")
  :config (enzuru-configure-omtose-theme))

(provide 'enzuru-omtose-darker)
