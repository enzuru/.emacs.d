;; -*- coding: utf-8; lexical-binding: t -*-

(require 'enzuru-dash)

(nyan-mode)

(setq mac-command-modifier 'control)
(setq nyan-bar-length 5)
(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")
(setq locate-command "mdfind")
(setq locate-make-command-line
      (lambda (ss) (list locate-command "-name" ss)))

(set-face-attribute 'default nil
                    :family "Menlo" :height 120 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Bookerly" :height 135 :weight 'normal)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(provide 'enzuru-mac)
