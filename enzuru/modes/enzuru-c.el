;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-c-ts-mode ()
  (add-hook 'c-mode-hook 'eglot-ensure)
  (setq c-default-style "linux"))

(defun enzuru-configure-semantic ()
  (global-ede-mode 1)
  (semantic-mode 1))

;; Packages

(use-package c-ts-mode
  :config (enzuru-configure-c-ts-mode)
  :defer t
  :bind (:map c-ts-mode-map (("C-c d" . enzuru-man-open)))
  ;; :hook ((c-ts-mode . eglot-ensure))
  :mode (("\\.c$" . c-ts-mode)
         ("\\.h$" . c-ts-mode)))

(use-package semantic
  :defer t
  :config (enzuru-configure-semantic))

(provide 'enzuru-c)
