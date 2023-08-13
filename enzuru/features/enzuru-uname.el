;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-uname ()
  (intern (string-trim (shell-command-to-string "uname"))))

(provide 'enzuru-uname)
