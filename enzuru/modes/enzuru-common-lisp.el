;; -*- coding: utf-8; lexical-binding: t -*-

;; Directories

(straight-use-package
 '(sly-repl-ansi-color
   :type git
   :host github
   :repo "PuercoPop/sly-repl-ansi-color"))

(straight-use-package
 '(ivy-common-lisp
   :type git
   :host github
   :repo "enzuru/ivy-common-lisp"))

(load-library "ivy-common-lisp")

;; Functions

(defun enzuru-configure-sly ()
  (push 'sly-repl-ansi-color sly-contribs))

(defun enzuru-configure-ivy-common-lisp ()
  (setq ivy-common-lisp-spec-function 'sly-hyperspec-lookup))

;; Packages

(use-package sly
  :ensure t
  :config (enzuru-configure-sly)
  :bind (("C-h s" . ivy-describe-common-lisp-spec-symbol)
         (:map lisp-mode-map
               ("C-x C-d" . sly-documentation)
               ("C-x C-w" . sly-edit-definition-other-window)
               ("C-x c" . sly-eval-buffer))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(enzuru-configure-ivy-common-lisp)

(provide 'enzuru-common-lisp)
