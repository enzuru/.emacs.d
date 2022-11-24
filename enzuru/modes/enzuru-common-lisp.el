;; -*- coding: utf-8; lexical-binding: t -*-

;; Directories

(add-to-list 'load-path "~/.emacs.d/local/sly-repl-ansi-color")

;; Functions

(defun enzuru-configure-sly ()
  (push 'sly-repl-ansi-color sly-contribs))

;; Packages

(use-package sly
  :ensure t
  :config (enzuru-configure-sly)
  :bind (:map lisp-mode-map
              ("C-x C-d" . sly-documentation)
              ("C-x C-w" . sly-edit-definition-other-window)
              ("C-x c" . sly-eval-buffer)))

(use-package sly-quicklisp
  :ensure t)

(provide 'enzuru-common-lisp)
