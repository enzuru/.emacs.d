;;; enzuru-log.el --- Log file configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package itail
  :hook ((itail-mode . auto-revert-mode))
  :mode (("\\log$" . itail-mode))
  :ensure t)

(provide 'enzuru-log)

;;; enzuru-log.el ends here
