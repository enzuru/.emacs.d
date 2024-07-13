;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-cider ()
  (cider-auto-test-mode 1)
  (setq cider-test-show-report-on-success t)
  (setq cider-session-name-template "%J:%h"))

(defun enzuru-configure-completing-read-cider ()
  (require 'completing-read-cider)
  (define-key clojure-mode-map (kbd "C-c y") 'completing-read-cider)
  (define-key cider-repl-mode-map (kbd "C-c y") 'completing-read-cider))

;; Packages

(use-package clojure-ts-mode
  :ensure t
  :defer t)

(use-package cider
  :ensure t
  :defer t
  :config (enzuru-configure-cider)
  :bind (:map clojure-mode-map
              ("C-c d" . cider-doc)
              ("C-c o" . cider-eval-buffer)))

(straight-use-package
 '(completing-read-cider
   :type git
   :host github
   :repo "enzuru/completing-read-cider"))

(enzuru-configure-completing-read-cider)

(provide 'enzuru-clojure)
