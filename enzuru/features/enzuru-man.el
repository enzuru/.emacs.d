;;; enzuru-man.el --- Manual page utilities -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-man-open ()
  (interactive)
  (manual-entry (current-word)))

(provide 'enzuru-man)

;;; enzuru-man.el ends here
