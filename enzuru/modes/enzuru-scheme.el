;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (require 'geiser-guile)
  (add-hook 'scheme-mode-hook (lambda () ("C-x c" . 'geiser-load-current-buffer)))
  (add-hook 'scheme-mode-hook (lambda () ("C-x C-d" . 'geiser-doc-symbol-at-point)))
  (setq geiser-active-implementations '(guile)))

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

;; (use-package geiser
;;   :ensure t
;;   :bind (:map scheme-mode-map
;;               ("C-x c" . geiser-load-current-buffer)
;;               ("C-x C-d" . geiser-doc-symbol-at-point))
;;   :mode (("\\.scm$" . geiser-mode)
;;          ("\\.guile$" . geiser-mode)))

;; (use-package geiser-guile
;;   :ensure t
;;   :config (enzuru-configure-geiser-guile))

(use-package scheme
  :ensure t
  :defer t
  :mode (("\\.scm$" . scheme-mode)
         ("\\.guile$" . scheme-mode)))

(enzuru-configure-geiser-guile)

(provide 'enzuru-scheme)
