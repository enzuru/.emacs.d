;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-geiser-guile ()
  (setq geiser-active-implementations '(guile)))

;; Packages

(use-package flycheck-guile
  :ensure t)

(use-package geiser
  :ensure t
  :bind (("C-x c" . geiser-load-current-buffer)
         ("C-x d" . geiser-doc-symbol-at-point))
  :mode (("\\.scm$" . geiser-mode)
         ("\\.guile$" . geiser-mode)))

(use-package geiser-guile
  :ensure t
  :config (enzuru-configure-geiser-guile))

(use-package scheme
  :ensure t
  :mode (("\\.scm$" . 'scheme-mode)
         ("\\.guile$" . 'scheme-mode)))

(provide 'enzuru-scheme)
