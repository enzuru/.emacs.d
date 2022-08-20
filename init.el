;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/enzuru/features")
(add-to-list 'load-path "~/.emacs.d/enzuru/modes")
(add-to-list 'load-path "~/.emacs.d/enzuru/preferences")
(add-to-list 'load-path "~/.emacs.d/enzuru/setup")
(add-to-list 'load-path "~/.emacs.d/enzuru/operating-systems")
(add-to-list 'load-path "~/.emacs.d/enzuru/themes")

(require 'enzuru-packages)

;; Features

(require 'enzuru-arrangements)
(require 'enzuru-autocompletion)
(require 'enzuru-gemini)
(require 'enzuru-browser)
(require 'enzuru-dashboard)
(require 'enzuru-debugger)
(require 'enzuru-desktop)
(require 'enzuru-documentation)
(require 'enzuru-elisp)
(require 'enzuru-file-management)
(require 'enzuru-help)
(require 'enzuru-hyperlinking)
(require 'enzuru-irc)
(require 'enzuru-mail)
(require 'enzuru-modeline)
(require 'enzuru-movement)
(require 'enzuru-music)
(require 'enzuru-project-management)
(require 'enzuru-scratch)
(require 'enzuru-search)
(require 'enzuru-server)
(require 'enzuru-shell)
(require 'enzuru-syntax-checking)
(require 'enzuru-spelling)
(require 'enzuru-uname)
(require 'enzuru-undo)
(require 'enzuru-remote)
(require 'enzuru-version-control)
(require 'enzuru-writing)

;; Modes

(require 'enzuru-c)
(require 'enzuru-css)
(require 'enzuru-clojure)
(require 'enzuru-common-lisp)
(require 'enzuru-emacs-lisp)
(require 'enzuru-epub)
(require 'enzuru-feature)
(require 'enzuru-fish)
(require 'enzuru-fountain)
(require 'enzuru-go)
(require 'enzuru-groovy)
(require 'enzuru-haskell)
(require 'enzuru-java)
(require 'enzuru-javascript)
(require 'enzuru-json)
(require 'enzuru-kotlin)
(require 'enzuru-kubernetes)
(require 'enzuru-lisp)
(require 'enzuru-markdown)
(require 'enzuru-objective-c)
(require 'enzuru-org)
(require 'enzuru-php)
(require 'enzuru-puppet)
(require 'enzuru-python)
(require 'enzuru-ruby)
(require 'enzuru-rust)
(require 'enzuru-scheme)
(require 'enzuru-swift)
(require 'enzuru-typescript)
(require 'enzuru-terraform)
(require 'enzuru-web)
(require 'enzuru-yaml)

;; Preferences

(require 'enzuru-bars)
(require 'enzuru-bell)
(require 'enzuru-buffers)
(require 'enzuru-customization)
(require 'enzuru-frames)
(require 'enzuru-highlighting)
(require 'enzuru-margin)
(require 'enzuru-recent-files)
(require 'enzuru-saving)
(require 'enzuru-scrolling)
(require 'enzuru-tabs)

;; Final setup

(require 'enzuru-cleanup)
(require 'enzuru-keys)
(require 'enzuru-shutdown)
(require 'enzuru-skin)

;; Operating systems

(if (eq system-type 'gnu/linux)
    (require 'enzuru-linux))
(if (eq system-type 'darwin)
    (require 'enzuru-mac))
(if (eq (enzuru-uname) 'FreeBSD)
    (require 'enzuru-freebsd))
(if (eq (enzuru-uname) 'OpenBSD)
    (require 'enzuru-openbsd))
(if (eq system-type 'windows-nt)
    (require 'enzuru-windows))

;; Local customization

(if (file-exists-p "~/.emacs.d/local.el")
    (load "~/.emacs.d/local.el"))
