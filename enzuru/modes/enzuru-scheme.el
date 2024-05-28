;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (require 'geiser-guile)
  (add-hook 'scheme-mode-hook 'turn-on-geiser-mode)
  (add-hook 'scheme-mode-hook 'lispy-mode)
  (add-hook 'scheme-mode-hook 'guix-devel-mode)
  (setq geiser-debug-show-debug t)
  (define-key scheme-mode-map (kbd "C-x c") 'geiser-load-current-buffer)
  (define-key scheme-mode-map (kbd "C-x r") 'geiser-eval-region)
  (define-key scheme-mode-map (kbd "C-x C-w") 'geiser-edit-symbol-at-point)
  (define-key scheme-mode-map (kbd "C-x C-d") 'geiser-doc-symbol-at-point))

(defun enzuru-configure-completing-read-geiser ()
  (require 'completing-read-geiser)
  (define-key scheme-mode-map (kbd "C-h s") 'completing-read-geiser)
  (define-key geiser-repl-mode-map (kbd "C-h s") 'completing-read-geiser))

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

(use-package scheme
  :ensure t
  :defer t
  :mode (("\\.scm$" . scheme-mode)
         ("\\.guile$" . scheme-mode)))

(enzuru-configure-geiser-guile)
(enzuru-configure-completing-read-geiser)

(provide 'enzuru-scheme)
