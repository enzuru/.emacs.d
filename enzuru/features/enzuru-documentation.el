;;; enzuru-documentation.el --- Documentation tools configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package devdocs
  :ensure t
  :bind (("C-c d" . devdocs-search)))

(provide 'enzuru-documentation)

;;; enzuru-documentation.el ends here
