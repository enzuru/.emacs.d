;;; enzuru-groovy.el --- Groovy programming language support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package groovy-mode
  :ensure t
  :mode (("\\Jenkinsfile" . groovy-mode))
  :defer t)

(provide 'enzuru-groovy)

;;; enzuru-groovy.el ends here
