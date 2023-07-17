;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-flymake ()
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

;; Packages

(use-package flymake
  :ensure t
  :bind (("C-x n" . flymake-goto-next-error)
         ("C-x p" . flymake-goto-prev-error))
  :hook ((prog-mode . flymake-mode))
  :config (enzuru-configure-flymake))

(provide 'enzuru-syntax-checking)
