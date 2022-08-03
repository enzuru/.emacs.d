;; -*- coding: utf-8; lexical-binding: t -*-

(require 'enzuru-dash)

(setq mac-command-modifier 'control)
(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")
(setq locate-command "mdfind")
(setq locate-make-command-line
      (lambda (ss) (list locate-command "-name" ss)))

(setq notmuch-command "~/.emacs.d/bin/notmuch")

(set-face-attribute 'default nil
                    :family "Menlo" :height 140 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Bookerly" :height 135 :weight 'normal)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(setq ns-use-native-fullscreen t)

(provide 'enzuru-mac)
