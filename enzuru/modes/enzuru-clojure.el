;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-cider ()
  (cider-auto-test-mode 1)
  (setq cider-test-show-report-on-success t)
  (setq cider-session-name-template "%J:%h"))

(defun enzuru-configure-completing-read-cider ()
  (require 'completing-read-cider)
  (define-key clojure-mode-map (kbd "C-h s") 'completing-read-cider)
  (define-key cider-repl-mode-map (kbd "C-h s") 'completing-read-cider))

;; Packages

(use-package cider
  :ensure t
  :defer t
  :config (enzuru-configure-cider)
  :bind (:map clojure-mode-map
              ("C-x C-w" . cider-test-jump)
              ("C-x C-d" . cider-doc)
              ("C-x c" . cider-eval-buffer)))

(use-package clojure-ts-mode
  :ensure t
  :defer t)

(straight-use-package
 '(completing-read-cider
   :type git
   :host github
   :repo "enzuru/completing-read-cider"))

(enzuru-configure-completing-read-cider)

(provide 'enzuru-clojure)
