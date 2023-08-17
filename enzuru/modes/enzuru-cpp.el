;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-c++-mode ()
  (add-hook 'c++-mode-hook 'eglot-ensure))

(enzuru-configure-c++-mode)

;; Packages

(provide 'enzuru-c++-mode)
