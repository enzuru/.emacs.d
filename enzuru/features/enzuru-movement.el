;;; enzuru-movement.el --- Window and cursor movement configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-windmove ()
  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings)))

;; Packages

(enzuru-configure-windmove)

(provide 'enzuru-movement)

;;; enzuru-movement.el ends here
