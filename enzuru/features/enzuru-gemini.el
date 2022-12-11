;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-elpher ()
  (setf elpher-default-url-type "gemini"))

;; Packages

(use-package elpher
  :config (enzuru-configure-elpher)
  :ensure t
  :defer t)

(provide 'enzuru-gemini)
