;;; enzuru-debugging.el --- Debugging configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-debugging-on ()
  (interactive)
  (setq debug-on-error t
        debug-on-event t
        debug-on-message t
        edebug-all-forms t))

;; (enzuru-debugging-on)

(provide 'enzuru-debugging)

;;; enzuru-debugging.el ends here
