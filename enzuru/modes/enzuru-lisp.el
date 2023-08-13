;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package lispy
  :ensure t
  :diminish lispy-mode
  :hook ((emacs-lisp-mode . lispy-mode)
         (ielm-mode . lispy-mode)
         (lisp-mode . lispy-mode)
         (lisp-interaction-mode . lispy-mode)
         (geiser-repl-mode . lispy-mode)
         (sly-mrepl-mode . lispy-mode)
         (cider-repl-mode . lispy-mode)
         (scheme-mode . lispy-mode)
         (minibuffer-mode . lispy-mode)))

(provide 'enzuru-lisp)
