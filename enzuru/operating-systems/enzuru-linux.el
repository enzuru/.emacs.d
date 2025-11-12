;;; enzuru-linux.el --- Linux specific configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(require 'enzuru-docker)

;; Functions

(defun enzuru-async-term ()
  "Open terminal"
  (interactive)
  (start-process "kitty" "kitty" "kitty"))

;; Variables

(setq consult-locate-args "locate -d /home/enzuru/locatedb.n"
      ccls-executable "ccls"
      browse-url-browser-function 'eww-browse-url
      inferior-lisp-program "sbcl"
      multi-term-program "fish")

(provide 'enzuru-linux)

;;; enzuru-linux.el ends here
