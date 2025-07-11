;;; enzuru-arjen-grey.el --- Arjen Grey theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: themes, faces

;;; Commentary:

;; Configuration for the Arjen Grey color theme.

;;; Code:

;; Configuration

(defun enzuru-configure-arjen-grey-theme ()
  (load-theme 'arjen-grey t)
  (set-face-background 'hl-line "#000000")
  (set-face-background 'mode-line-inactive "#2A2F38")
  (custom-theme-set-variables
   'arjen-grey
   '(main-line-color1 "#191919")
   '(main-line-color2 "#111111")
   '(fringe-mode 6 nil (fringe))
   '(hl-line ((t (:inherit highlight :background "#4B0082")))))
  (sml/apply-theme 'respectful))

;; Packages

(use-package arjen-grey-theme
  :ensure (:host github :repo "credmp/arjen-grey-theme")
  :config (enzuru-configure-arjen-grey-theme))

(provide 'enzuru-arjen-grey)

;;; enzuru-arjen-grey.el ends here
