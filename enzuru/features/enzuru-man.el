;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-man-open ()
  (interactive)
  (manual-entry (current-word)))

(provide 'enzuru-man)
