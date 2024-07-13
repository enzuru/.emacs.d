;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-sly-repl-ansi-color ()
  (add-to-list 'sly-contribs 'sly-repl-ansi-color))

(defun enzuru-sly-describe-symbol-at-point ()
  (interactive)
  (sly-describe-symbol (word-at-point)))

(defun enzuru-configure-completing-read-sly ()
  (require 'completing-read-sly)
  (define-key lisp-mode-map (kbd "C-c y") 'completing-read-sly)
  (define-key sly-mode-map (kbd "C-c y") 'completing-read-sly))

;; Packages

(use-package sly
  :ensure t
  :bind ((:map lisp-mode-map
               ("C-c d" . enzuru-sly-describe-symbol-at-point)
               ("C-c c" . sly-eval-buffer)
               ("C-x r" . sly-eval-region))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(straight-use-package
 '(sly-repl-ansi-color
   :type git
   :host github
   :repo "PuercoPop/sly-repl-ansi-color"))
(enzuru-configure-sly-repl-ansi-color)

(straight-use-package
 '(completing-read-sly
   :type git
   :host github
   :repo "enzuru/completing-read-sly"))
(enzuru-configure-completing-read-sly)

(provide 'enzuru-common-lisp)
