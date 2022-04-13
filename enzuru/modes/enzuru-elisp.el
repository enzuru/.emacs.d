;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package elisp-benchmarks
  :ensure t
  :bind (:map emacs-lisp-mode-map
              ("C-x c" . eval-buffer)))

(provide 'enzuru-elisp)
