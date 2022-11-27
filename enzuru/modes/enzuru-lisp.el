;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package lispy
  :ensure t
  :diminish lispy-mode
  :hook ((emacs-lisp-mode . lispy-mode)
         (ielm-mode . lispy-mode)
         (lisp-mode . lispy-mode)
         (lisp-interaction-mode . lispy-mode)
         (scheme-mode . lispy-mode)))

(use-package rainbow-blocks
  :ensure t
  :diminish rainbow-blocks-mode
  :hook ((lispy-mode . rainbow-blocks-mode)))

(provide 'enzuru-lisp)
