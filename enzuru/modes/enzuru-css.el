;;; enzuru-css.el --- CSS styling language support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-css-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.css$" . css-ts-mode)))

(enzuru-configure-css-ts-mode)

(provide 'enzuru-css)

;;; enzuru-css.el ends here
