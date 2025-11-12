;;; enzuru-uname.el --- System information utilities -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-uname ()
  (intern (string-trim (shell-command-to-string "uname"))))

(provide 'enzuru-uname)

;;; enzuru-uname.el ends here
