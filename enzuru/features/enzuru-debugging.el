;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-debugging-on ()
  (setq debug-on-error t
        debug-on-event t
        debug-on-message t
        edebug-all-forms t))

;; (enzuru-debugging-on)

(provide 'enzuru-debugging)
