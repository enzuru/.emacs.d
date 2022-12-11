;; -*- coding: utf-8; lexical-binding: t -*-

(fringe-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(if (eq system-type 'darwin)
    (require 'enzuru-molokai))
(if (eq system-type 'windows-nt)
    (require 'enzuru-arjen-grey))
(if (eq (enzuru-uname) 'FreeBSD)
    (require 'enzuru-omtose-darker))
(if (eq (enzuru-uname) 'OpenBSD)
    (require 'enzuru-zenburn))
(if (eq system-type 'gnu/linux)
    (require 'enzuru-gotham))

(provide 'enzuru-gui)
