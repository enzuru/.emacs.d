;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-company-spell ()
  (straight-use-package
   '(company-spell
     :type git
     :host github
     :repo "enzuru/company-spell"
     :fork (:repo "enzuru/company-spell" :branch "async")))
  (require 'company-spell)
  (push 'company-spell company-backends))

(defun enzuru-configure-flycheck-aspell ()
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'mail-aspell-dynamic))

;; Packages

(use-package flycheck-aspell
  :ensure t
  :defer t
  :config (enzuru-configure-flycheck-aspell))

(enzuru-load-company-spell)

(provide 'enzuru-spelling)
