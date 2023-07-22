;; -*- coding: utf-8; lexical-binding: t -*-

;; Directories

(straight-use-package
 '(sly-repl-ansi-color
   :type git
   :host github
   :repo "PuercoPop/sly-repl-ansi-color"))

(straight-use-package
 '(completing-read-sly
   :type git
   :host github
   :repo "enzuru/completing-read-sly"))

(require 'completing-read-sly)

;; Functions

(defun enzuru-configure-sly ()
  (push 'sly-repl-ansi-color sly-contribs))

(defun enzuru-configure-completing-read-sly ()
  (setq completing-read-sly-spec-function 'sly-describe-symbol))

(defun enzuru-sly-describe-symbol-at-point ()
  (interactive)
  (sly-describe-symbol (word-at-point)))

;; Packages

(use-package sly
  :ensure t
  :config (enzuru-configure-sly)
  :bind (
         ("C-h s" . completing-read-sly)
         (:map lisp-mode-map
               ("C-x C-d" . enzuru-sly-describe-symbol-at-point)
               ("C-x C-w" . sly-edit-definition-other-window)
               ("C-x c" . sly-eval-buffer))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(enzuru-configure-completing-read-sly)

(provide 'enzuru-common-lisp)
