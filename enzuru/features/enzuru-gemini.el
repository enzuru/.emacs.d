;;; enzuru-gemini.el --- Gemini protocol browser configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions


;; Packages

(use-package elpher
  :ensure t
  :defer t
  :custom
  (elpher-default-url-type "gemini"))

(provide 'enzuru-gemini)

;;; enzuru-gemini.el ends here
