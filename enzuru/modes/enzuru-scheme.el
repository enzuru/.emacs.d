;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (require 'geiser)
  (require 'geiser-guile)
  (add-hook 'scheme-mode-hook 'geiser-mode)
  (define-key scheme-mode-map (kbd "C-x c") 'geiser-load-current-buffer)
  (define-key scheme-mode-map (kbd "C-x C-d") 'geiser-doc-symbol-at-point))

;; Packages

(straight-use-package
 '(geiser
   :protocol https
   :type git
   :host gitlab
   :repo "emacs-geiser/geiser"))

(straight-use-package
 '(geiser-guile
   :protocol https
   :type git
   :host gitlab
   :repo "emacs-geiser/guile"))

(use-package scheme
  :ensure t
  :defer t
  :mode (("\\.scm$" . scheme-mode)
         ("\\.guile$" . scheme-mode)))

(enzuru-configure-geiser-guile)

(provide 'enzuru-scheme)
