;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-yasnippet ()
  (yas-global-mode 1))

;; Packages

(use-package yasnippet
  :ensure t
  :config (enzuru-configure-yasnippet))

(provide 'enzuru-snippets)
