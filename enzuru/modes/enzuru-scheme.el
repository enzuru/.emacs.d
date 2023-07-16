;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (require 'geiser-guile)
  (add-hook 'scheme-mode-hook 'geiser-mode)
  (define-key scheme-mode-map (kbd "C-x c") 'geiser-load-current-buffer)
  (define-key scheme-mode-map (kbd "C-x C-d") 'geiser-doc-symbol-at-point))

(defun enzuru-configure-ivy-guile ()
  (define-key scheme-mode-map (kbd "C-h s") 'ivy-geiser-describe-symbol)
  (define-key geiser-repl-mode-map (kbd "C-h s") 'ivy-geiser-describe-symbol))

;; Packages

(straight-use-package
 '(geiser-guile
   :protocol https
   :type git
   :host gitlab
   :repo "emacs-geiser/guile"))

(straight-use-package
 '(ivy-geiser
   :type git
   :host github
   :repo "enzuru/ivy-geiser"))

(load-library "ivy-geiser")

(use-package scheme
  :ensure t
  :defer t
  :mode (("\\.scm$" . scheme-mode)
         ("\\.guile$" . scheme-mode)))

(enzuru-configure-geiser-guile)
(enzuru-configure-ivy-guile)

(provide 'enzuru-scheme)
