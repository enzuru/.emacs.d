;; -*- coding: utf-8; lexical-binding: t -*-

(fringe-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(if (eq system-type 'darwin)
    (require 'enzuru-gotham))
(if (eq system-type 'windows-nt)
    (require 'enzuru-arjen-grey))
(if (eq (enzuru-uname) 'FreeBSD)
    (require 'enzuru-deep-thought))
(if (eq (enzuru-uname) 'OpenBSD)
    (require 'enzuru-zenburn))
(if (eq system-type 'gnu/linux)
    (require 'enzuru-omtose-darker))

(provide 'enzuru-gui)
