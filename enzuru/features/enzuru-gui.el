;;; enzuru-gui.el --- GUI appearance and theme configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: faces, gui, themes, appearance

;;; Commentary:

;; This module configures GUI appearance including minimalistic settings
;; and operating system-specific theme selection.

;;; Code:

;; Functions

(defun enzuru-configure-minimalism ()
  (fringe-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun enzuru-configure-operating-systems ()
  (if (eq system-type 'darwin)
      (require 'enzuru-exotica))
  (if (eq system-type 'windows-nt)
      (require 'enzuru-arjen-grey))
  (if (eq (enzuru-uname) 'FreeBSD)
      (require 'enzuru-zenburn))
  (if (eq (enzuru-uname) 'OpenBSD)
      (require 'enzuru-omtose-darker))
  (if (eq system-type 'gnu/linux)
      (require 'enzuru-molokai)))

(enzuru-configure-minimalism)
(enzuru-configure-operating-systems)

(provide 'enzuru-gui)

;;; enzuru-gui.el ends here
