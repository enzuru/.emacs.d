;;; enzuru-music.el --- Music player configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, music, emms, pianobar

;;; Commentary:

;; This module configures music players including EMMS and Pianobar
;; for playing music from within Emacs.

;;; Code:

;; Configuration

(defun enzuru-configure-emms ()
  (emms-all)
  (emms-add-directory-tree "~/music/"))


;; Packages

(use-package emms
  :ensure t
  :defer t
  :custom
  (emms-player-list '(emms-player-vlc))
  (emms-source-file-default-directory "~/music/")
  :config (enzuru-configure-emms))

(use-package pianobar
  :ensure t
  :defer t
  :custom
  (pianobar-username "lenzuru@gmail.com")
  (pianobar-station "66")
  (pianobar-enable-modeline nil))

(provide 'enzuru-music)

;;; enzuru-music.el ends here
