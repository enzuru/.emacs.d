;; -*- coding: utf-8; lexical-binding: t -*-

(require 'enzuru-docker)

;; Functions

(defun enzuru-async-term ()
  "Open terminal"
  (interactive)
  (start-process "kitty" "kitty" "kitty"))

(defun enzuru-setup-desktop ()
  (require 'enzuru-window-management))

(defun enzuru-setup-guix ()
  (require 'enzuru-guix))

;; Variables

(setq consult-locate-args "locate -d /home/enzuru/locatedb.n"
      ccls-executable "ccls"
      browse-url-browser-function 'eww-browse-url
      inferior-lisp-program "sbcl"
      multi-term-program "fish")

;; Keys

(global-set-key (kbd "C-c x") 'enzuru-async-term)

(enzuru-setup-guix)

(provide 'enzuru-linux)
