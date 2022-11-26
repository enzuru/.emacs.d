;; -*- coding: utf-8; lexical-binding: t -*-

(require 'enzuru-docker)

;; Functions

(defun enzuru-setup-desktop ()
  (require 'enzuru-window-management)
  (require 'enzuru-guix)
  (find-file "~/notes/index.org")
  (split-window-right)
  (switch-to-buffer "index.org")
  (with-eval-after-load 'geiser-guile
    (add-to-list 'geiser-guile-load-path "~/src/guix")))

(defun enzuru-async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc" "-fn" "xft:Iosevka:style=Regular:size=15"))

(if window-system
    (enzuru-setup-desktop))

;; Variables

(setq locate-command "locate -d /home/enzuru/locatedb.n")
(setq ccls-executable "ccls")
(setq browse-url-browser-function 'browse-url-emacs)
(setq inferior-lisp-program "sbcl")
(setq multi-term-program "fish")

;; Keys

(global-set-key (kbd "C-c x") 'enzuru-async-term)

(provide 'enzuru-linux)
