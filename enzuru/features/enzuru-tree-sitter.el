;;; enzuru-tree-sitter.el --- Tree-sitter parsing configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode))

(provide 'enzuru-tree-sitter)

;;; enzuru-tree-sitter.el ends here
