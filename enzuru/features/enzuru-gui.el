;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-minimalism ()
  (fringe-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun enzuru-configure-operating-systems ()
  (if (eq system-type 'darwin)
      (require 'enzuru-timu-macos))
  (if (eq system-type 'windows-nt)
      (require 'enzuru-arjen-grey))
  (if (eq (enzuru-uname) 'FreeBSD)
      (require 'enzuru-zenburn))
  (if (eq (enzuru-uname) 'OpenBSD)
      (require 'enzuru-omtose-darker))
  (if (eq system-type 'gnu/linux)
      (require 'enzuru-timu-rouge)))

(enzuru-configure-minimalism)
(enzuru-configure-operating-systems)

(provide 'enzuru-gui)
