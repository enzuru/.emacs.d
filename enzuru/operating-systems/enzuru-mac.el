;; -*- coding: utf-8; lexical-binding: t -*-

(require 'enzuru-dash)

;; Variables

(setq mac-command-modifier 'control
      locate-command "mdfind"
      consult-locate-args "mdfind"
      inferior-lisp-program "/opt/homebrew/bin/sbcl"
      locate-make-command-line (lambda (ss) (list locate-command "-name" ss)))

(menu-bar-mode)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Faces

(set-face-attribute 'default nil
                    :family "Monaco" :height 150 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Bookerly" :height 135 :weight 'normal)

;; Fullscreen

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(setq ns-use-native-fullscreen t)

;; Functions

(defun enzuru-configure-osx-browse ()
  (setq browse-url-browser-function 'osx-browse-url-safari))

;; Packages

(use-package osx-browse
  :ensure t
  :defer t
  :config (enzuru-configure-osx-browse))

(provide 'enzuru-mac)
