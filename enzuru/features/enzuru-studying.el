;;; enzuru-studying.el --- Programming study tools -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-exercism-submit ()
  (interactive)
  (shell-command (concat "exercism submit " (buffer-file-name))))

(provide 'enzuru-studying)

;;; enzuru-studying.el ends here
