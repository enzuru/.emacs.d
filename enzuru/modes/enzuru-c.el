;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-c-ts-mode ()
  (add-hook 'c-mode-hook 'eglot-ensure))

(defun enzuru-configure-semantic ()
  (global-ede-mode 1)
  (semantic-mode 1))

;; Packages

(use-package c-ts-mode
  :ensure t
  :config (enzuru-configure-c-ts-mode)
  :defer t
  :bind (:map c-ts-mode-map (("C-x C-d" . enzuru-man-open)))
  :mode (("\\.c$" . c-ts-mode)
         ("\\.h$" . c-ts-mode)))

(use-package semantic
  :ensure t
  :defer t
  :config (enzuru-configure-semantic))

(enzuru-configure-c-mode)

(provide 'enzuru-c)
