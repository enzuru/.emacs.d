;; -*- coding: utf-8; lexical-binding: t -*-

(if window-system
    (require 'enzuru-gui)
  (progn (require 'enzuru-molokai)
         (xterm-mouse-mode t)))

(provide 'enzuru-interface)
