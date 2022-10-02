;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-exercism-submit ()
  (interactive)
  (shell-command (concat "exercism submit " (buffer-file-name))))

(provide 'enzuru-studying)
