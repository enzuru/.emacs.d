;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(straight-use-package
 '(fish-completion
   :protocol https
   :type git
   :host gitlab
   :repo "Ambrevar/emacs-fish-completion"))

(use-package fish-mode
  :ensure t
  :defer t)

(provide 'enzuru-fish)
