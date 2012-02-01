;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(provide 'enzuru-json)
