;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-json-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode)))

(enzuru-configure-json-ts-mode)

(provide 'enzuru-json)
