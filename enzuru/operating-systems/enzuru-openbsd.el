;;; enzuru-openbsd.el --- OpenBSD specific configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: os, openbsd

;;; Commentary:

;; Configuration specific to OpenBSD operating system.

;;; Code:

(setq locate-command "locate"
      inferior-lisp-program "/usr/local/bin/ecl"
      elpy-rpc-python-command "python3"
      locate-make-command-line
      (lambda (ss) (list locate-command "/home/enzuru" "-name" ss)))

(set-face-attribute 'default nil
                    :family "Terminus" :height 160 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Open Baskerville 0.0.75" :height 130 :weight 'normal)

(defun enzuru-async-term ()
  "Open terminal"
  (interactive)
  (start-process "kitty" "kitty" "kitty"))

(find-file "~/org/index.org")

(provide 'enzuru-openbsd)

;;; enzuru-openbsd.el ends here
