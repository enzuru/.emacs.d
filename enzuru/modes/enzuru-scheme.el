;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (require 'geiser-guile)
  (add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))
  (add-to-list 'auto-mode-alist '("\\.guile$" . scheme-mode))
  (add-hook 'scheme-mode-hook 'turn-on-geiser-mode)
  (add-hook 'scheme-mode-hook 'lispy-mode)
  (setq geiser-debug-show-debug t)
  (define-key scheme-mode-map (kbd "C-c o") 'geiser-load-current-buffer)
  (define-key scheme-mode-map (kbd "C-x r") 'geiser-eval-region)
  (define-key scheme-mode-map (kbd "C-c d") 'geiser-doc-symbol-at-point))

(defun enzuru-configure-completing-read-geiser ()
  (require 'completing-read-geiser)
  (define-key scheme-mode-map (kbd "C-c i") 'completing-read-geiser)
  (define-key geiser-repl-mode-map (kbd "C-c i") 'completing-read-geiser))

;; Packages

(straight-use-package
 '(geiser-guile
   :protocol https
   :type git
   :host gitlab
   :repo "emacs-geiser/guile"))

(straight-use-package
 '(completing-read-geiser
   :type git
   :host github
   :repo "enzuru/completing-read-geiser"))

(enzuru-configure-geiser-guile)
(enzuru-configure-completing-read-geiser)

(provide 'enzuru-scheme)
