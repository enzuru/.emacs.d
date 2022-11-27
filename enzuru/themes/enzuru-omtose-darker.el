;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-omtose-theme ()
  (load-theme 'omtose-darker t)
  (set-face-background 'hl-line "#301934")
  (sml/apply-theme 'respectful))

;; Packages

(straight-use-package '(omtose-phellack-theme :type git :host github :repo "franksn/omtose-phellack-theme"))

(enzuru-configure-omtose-theme)

(provide 'enzuru-omtose-darker)
