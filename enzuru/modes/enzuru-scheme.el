;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (setq geiser-active-implementations '(guile)))

;; Packages

(use-package geiser
  :ensure t
  :bind (:map scheme-mode-map
              ("C-x c" . geiser-load-current-buffer)
              ("C-x C-d" . geiser-doc-symbol-at-point))
  :mode (("\\.scm$" . geiser-mode)
         ("\\.guile$" . geiser-mode)))

(use-package geiser-guile
  :ensure t
  :config (enzuru-configure-geiser-guile))

(use-package scheme
  :ensure t
  :defer t
  :mode (("\\.scm$" . scheme-mode)
         ("\\.guile$" . scheme-mode)))

(provide 'enzuru-scheme)
