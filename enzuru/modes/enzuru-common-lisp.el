;; -*- coding: utf-8; lexical-binding: t -*-

;; Directories

(straight-use-package '(sly-repl-ansi-color :type git :host github :repo "PuercoPop/sly-repl-ansi-color"))

;; Functions

(defun enzuru-configure-sly ()
  (push 'sly-repl-ansi-color sly-contribs))

;; Packages

(use-package common-lisp-snippets
  :ensure t
  :defer t)

(use-package sly
  :ensure t
  :config (enzuru-configure-sly)
  :bind (:map lisp-mode-map
              ("C-x C-d" . sly-documentation)
              ("C-x C-w" . sly-edit-definition-other-window)
              ("C-x c" . sly-eval-buffer)))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(provide 'enzuru-common-lisp)
