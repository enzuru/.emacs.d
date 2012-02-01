;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package sly
  :ensure t
  :bind (:map lisp-mode-map
              ("C-x C-d" . sly-documentation)
              ("C-x C-w" . sly-edit-definition-other-window)
              ("C-x c" . sly-eval-buffer)))

(use-package sly-quicklisp
  :ensure t)

(provide 'enzuru-common-lisp)
