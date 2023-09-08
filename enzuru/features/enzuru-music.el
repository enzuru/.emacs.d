;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-emms ()
  (emms-all)
  (setq emms-player-list '(emms-player-vlc)
        emms-source-file-default-directory "~/music/")
  (emms-add-directory-tree "~/music/"))

(defun enzuru-configure-pianobar ()
  (setq pianobar-username "lenzuru@gmail.com"
        pianobar-station "12"
        pianobar-enable-modeline nil))

;; Packages

(use-package emms
  :ensure t
  :defer t
  :config (enzuru-configure-emms))

(use-package pianobar
  :ensure t
  :defer t
  :config (enzuru-configure-pianobar))

(provide 'enzuru-music)
