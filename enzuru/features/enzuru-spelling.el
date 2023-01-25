;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-load-company-spell ()
  (straight-use-package
   '(company-spell
     :type git
     :host github
     :repo "enzuru/company-spell"
     :fork (:repo "enzuru/company-spell" :branch "master")))
  (require 'company-spell)
  (push 'company-spell company-backends))

;; Packages

(use-package flymake-aspell
  :ensure t
  :hook ((text-mode-hook . flymake-aspell-setup)))

(enzuru-load-company-spell)

(provide 'enzuru-spelling)
