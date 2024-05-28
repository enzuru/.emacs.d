;; -*- coding: utf-8; lexical-binding: t -*-

(require 'auth-source)

;; Configuration

(defun enzuru-configure-gptel ()
  (global-set-key (kbd "C-x i") 'gptel))

;; Packages

(use-package gptel
  :ensure t
  :defer t
  :config (enzuru-configure-gptel)
  :bind (:map gptel-mode-map
              ("C-x c" . gptel-send)))

(provide 'enzuru-llm)
