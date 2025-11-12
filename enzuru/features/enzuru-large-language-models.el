;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(require 'auth-source)

;; Functions

(defun enzuru-configure-claude-code ()
  (claude-code-mode))

(defun enzuru-configure-gptel ()
  (setq gptel-model 'claude-3-7-sonnet-20250219)
  (setq gptel-backend (gptel-make-anthropic "Claude" :stream t :key 'gptel-api-key-from-auth-source)))

;; Packages

(use-package claude-code
  :ensure (:type git :host github :repo "enzuru/claude-code.el" :branch "update-transient")
  :defer t
  :bind-keymap ("C-c c" . claude-code-command-map) ;; or your preferred key
  :config (enzuru-configure-claude-code))

(use-package gptel
  :ensure t
  :defer t
  :bind (:map gptel-mode-map
              ("C-c o" . gptel-send))
  :config (enzuru-configure-gptel))

(provide 'enzuru-large-language-models)

;;; enzuru-large-language-models.el ends here
