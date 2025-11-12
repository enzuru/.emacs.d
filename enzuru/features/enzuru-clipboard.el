;;; enzuru-clipboard.el --- Clipboard management configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package clipetty
  :ensure t
  :diminish clipetty-mode
  :hook (after-init . global-clipetty-mode))

(provide 'enzuru-clipboard)

;;; enzuru-clipboard.el ends here
