;;; enzuru-music.el --- Music player configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-emms ()
  (emms-all)
  (emms-add-directory-tree "~/music/"))

(defun enzuru-configure-pianobar ()
  (setq pianobar-username "lenzuru@gmail.com")
  (setq pianobar-station "66")
  (setq pianobar-enable-modeline nil))

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
  :config (enzuru-configure-pianobar))

(provide 'enzuru-music)

;;; enzuru-music.el ends here
