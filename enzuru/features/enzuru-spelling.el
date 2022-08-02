;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-company-spell ()
  (add-to-list 'load-path "~/.emacs.d/local/company-spell")
  (require 'company-spell)
  (push 'company-spell company-backends))

(defun enzuru-configure-flycheck-aspell ()
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'mail-aspell-dynamic))

;; Packages

;; (use-package olivetti
;;   :ensure t)

(use-package flycheck-aspell
  :ensure t
  :config (enzuru-configure-flycheck-aspell))

(enzuru-load-company-spell)

(provide 'enzuru-spelling)
