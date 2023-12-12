;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(straight-use-package
 '(fish-completion
   :protocol https
   :type git
   :host github
   :repo "LemonBreezes/emacs-fish-completion"))

(use-package emacs-fish-completion
  :ensure t
  :defer t)

(use-package fish-mode
  :ensure t
  :defer t)

(provide 'enzuru-fish)
