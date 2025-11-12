;;; enzuru-clojure.el --- Clojure programming language support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-cider ()
  (cider-auto-test-mode 1))

(defun enzuru-configure-completing-read-cider ()
  (require 'completing-read-cider)
  (define-key clojure-mode-map (kbd "C-c i") 'completing-read-cider)
  (define-key cider-repl-mode-map (kbd "C-c i") 'completing-read-cider))

;; Packages

(use-package clojure-ts-mode
  :ensure t
  :defer t)

(use-package cider
  :ensure t
  :defer t
  :custom
  (cider-test-show-report-on-success t)
  (cider-session-name-template "%J:%h")
  :config (enzuru-configure-cider)
  :bind (:map clojure-mode-map
              ("C-c d" . cider-doc)
              ("C-c o" . cider-eval-buffer)))

(use-package completing-read-cider
  :ensure (:host github :repo "enzuru/completing-read-cider")
  :config (enzuru-configure-completing-read-cider))

(provide 'enzuru-clojure)

;;; enzuru-clojure.el ends here
