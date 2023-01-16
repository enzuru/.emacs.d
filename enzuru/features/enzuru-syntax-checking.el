;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-flymake ()
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

;; Packages

(use-package flymake
  :ensure t
  :hook ((prog-mode . flymake-mode))
  :config (enzuru-configure-flymake))

(provide 'enzuru-syntax-checking)
