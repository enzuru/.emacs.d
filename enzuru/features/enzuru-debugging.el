;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-debugging-on ()
  (setq debug-on-error t)
  (setq debug-on-event t)
  (setq debug-on-message t)
  (setq edebug-all-forms t))

;; (enzuru-debugging-on)

(provide 'enzuru-debugging)
