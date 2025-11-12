;;; enzuru-syntax-highlighting.el --- Enhanced syntax highlighting -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-prism ()
  (add-hook 'lisp-mode-hook 'prism-mode)
  (add-hook 'emacs-lisp-mode-hook 'prism-mode)
  (add-hook 'scheme-mode-hook 'prism-mode)
  (add-hook 'json-mode-hook 'prism-mode)
  (add-hook 'yaml-mode-hook 'prism-mode)
  (add-hook 'clojure-mode-hook 'prism-mode))

;; Packages

(use-package prism
  :ensure (:host github :repo "alphapapa/prism.el")
  :config (enzuru-configure-prism))

(provide 'enzuru-syntax-highlighting)

;;; enzuru-syntax-highlighting.el ends here
