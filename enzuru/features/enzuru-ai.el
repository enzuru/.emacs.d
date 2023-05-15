;; -*- coding: utf-8; lexical-binding: t -*-

(require 'auth-source)

;; Configuration

(defun enzuru-configure-chatgpt-shell ()
  (global-set-key (kbd "C-x i") 'chatgpt-shell)
  (setq chatgpt-shell-openai-key
        (auth-source-pick-first-password :host "api.openai.com")))

;; Packages

(use-package shell-maker
  :straight (:host github :repo "xenodium/chatgpt-shell" :files ("shell-maker.el")))

(use-package chatgpt-shell
  :requires shell-maker
  :straight (:host github :repo "xenodium/chatgpt-shell" :files ("chatgpt-shell.el")))

(enzuru-configure-chatgpt-shell)

(provide 'enzuru-ai)
