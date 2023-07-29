;; -*- coding: utf-8; lexical-binding: t -*-

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
  :straight (:host github :repo "alphapapa/prism.el"))

(enzuru-configure-prism)

(provide 'enzuru-syntax-highlighting)
