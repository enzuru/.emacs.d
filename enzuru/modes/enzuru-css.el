;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-css-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.css$" . css-ts-mode)))

(enzuru-configure-css-ts-mode)

(provide 'enzuru-css)
