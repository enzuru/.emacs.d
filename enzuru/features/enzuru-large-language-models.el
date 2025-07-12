;; -*- coding: utf-8; lexical-binding: t -*-

(require 'auth-source)

;; Functions

(defun enzuru-configure-claude-code ()
  (claude-code-mode))

;; Packages

(use-package gptel
  :ensure t
  :defer t
  :bind (:map gptel-mode-map
              ("C-c o" . gptel-send)))

(use-package claude-code
  :ensure (:type git :host github :repo "enzuru/claude-code.el" :branch "update-transient")
  :defer t
  :bind-keymap ("C-c c" . claude-code-command-map) ;; or your preferred key
  :config (enzuru-configure-claude-code))

(provide 'enzuru-large-language-models)
