;;; enzuru-arrangements.el --- Window and tab arrangements configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, windows, tabs, activities

;;; Commentary:

;; This module provides functions for arranging windows and tabs in Emacs,
;; including setting up predefined tab layouts for different workflows like
;; development, chat, and application management.

;;; Code:

;; Functions

(defun enzuru-configure-activities ()
  (activities-mode)
  (activities-tabs-mode))

(defun enzuru-tab-exists-p (tab-name)
  "Check if a tab exists with the given TAB-NAME."
  (catch 'tab-exists
    (dolist (tab (tab-bar-tabs))
      (when (string-equal (alist-get 'name tab) tab-name)
        (throw 'tab-exists t))) nil))

(defun enzuru-setup-tab-squares (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args)))
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-vertically)
      (switch-to-buffer four))))

(defun enzuru-setup-tab (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args))
        (five (nth 3 args))
        (six (nth 4 args))
        (seven (nth 5 args))
        (eight (nth 6 args)))
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer four))
    (when (> amount 4)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer five))
    (when (> amount 5)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer six))
    (when (> amount 6)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer seven))
    (when (> amount 8)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer eight))))

(defun enzuru-arrange-apps ()
  (interactive)
  ;; (enzuru-setup-tab "tasks" "*Guix Bugs*")
  (enzuru-setup-tab "hacking" "*dashboard*")
  (enzuru-setup-tab ".emacs.d" "init.el" "magit: .emacs.d")
  (enzuru-setup-tab "mail" "*Group*")
  ;; (enzuru-setup-tab "gemini" "*elpher*")
  ;; (enzuru-setup-tab "geiser" "*Geiser Guile REPL*")
  (enzuru-setup-tab "sly" "*sly-mrepl for sbcl*")
  (tab-bar-select-tab-by-name "hacking"))

(defun enzuru-arrange-chats ()
  (interactive)
  (enzuru-setup-tab "libera" "Libera.Chat" "#emacs" "#gnu" "#guile" "#guix" "#guix-hpc")
  (enzuru-setup-tab "tilde" "tilde.chat" "#politics" "#gemini" "#meta" "#institute" "#books")
  (enzuru-setup-tab "oftc" "OFTC" "#cat-v" "#dri-devel" "#kernelnewbies")
  (tab-bar-select-tab-by-name "hacking"))

(defun enzuru-add-chats ()
  (interactive)
  (znc-all))

(defun enzuru-add-apps ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  (magit-status)
  ;; (debbugs-gnu '("wishlist") '("emacs" "gnus" "guile" "guix-patches" "hyperbole" "guix"))
  (sly)
  (gnus)
  ;; (elpher)
  ;; (geiser 'guile)
  (enzuru-arrange-apps))

;; Packages

(use-package activities
  :ensure (:host github :repo "alphapapa/activities.el")
  :config (enzuru-configure-activities)
  :custom
  (activities-bookmark-store t))

(provide 'enzuru-arrangements)

;;; enzuru-arrangements.el ends here
