;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-java-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.java$" . java-ts-mode)))

(enzuru-configure-java-ts-mode)

(provide 'enzuru-java)
