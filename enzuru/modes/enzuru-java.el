;;; enzuru-java.el --- Java programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-configure-java-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.java$" . java-ts-mode)))

(enzuru-configure-java-ts-mode)

(provide 'enzuru-java)

;;; enzuru-java.el ends here
