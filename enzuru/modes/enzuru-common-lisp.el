;; -*- coding: utf-8; lexical-binding: t -*-

;; Directories

;; Functions

(defun enzuru-configure-sly ()
  (push 'sly-repl-ansi-color sly-contribs))

(defun enzuru-sly-describe-symbol-at-point ()
  (interactive)
  (sly-describe-symbol (word-at-point)))

(defun enzuru-configure-completing-read-sly ()
  (require 'completing-read-sly)
  (define-key lisp-mode-map (kbd "C-h s") 'completing-read-sly)
  (define-key sly-mrepl-mode-map (kbd "C-h s") 'completing-read-sly))

;; Packages

(use-package sly
  :ensure t
  :config (enzuru-configure-sly)
  :bind ((:map lisp-mode-map
               ("C-x C-d" . enzuru-sly-describe-symbol-at-point)
               ("C-x C-w" . sly-edit-definition-other-window)
               ("C-x c" . sly-eval-buffer)
               ("C-x r" . sly-eval-region))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

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

(enzuru-configure-completing-read-sly)

(provide 'enzuru-common-lisp)
