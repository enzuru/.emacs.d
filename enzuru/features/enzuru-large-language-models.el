;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, ai, llm, claude, gpt

;;; Commentary:

;; This module configures large language model integrations including
;; GPTel and Claude Code for AI assistance in Emacs.

;;; Code:

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

;;; enzuru-large-language-models.el ends here
