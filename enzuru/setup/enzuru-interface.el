;;; enzuru-interface.el --- Interface configuration for GUI and terminal modes -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, setup

;;; Commentary:

;; This module configures the interface based on whether Emacs is running
;; in GUI or terminal mode, setting up appropriate themes and mouse support.

;;; Code:

(if window-system
    (require 'enzuru-gui)
  (progn (require 'enzuru-molokai)
         (xterm-mouse-mode t)))

(provide 'enzuru-interface)

;;; enzuru-interface.el ends here
