;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-yasnippet ()
  (yas-global-mode 1))

;; Packages

(use-package yasnippet
  :ensure t
  :defer t
  :diminish (yas-global-mode yas-minor-mode)
  :config (enzuru-configure-yasnippet))

(provide 'enzuru-snippets)
