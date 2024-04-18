;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-hook-markdown-mode ()
  (setq-local completion-at-point-functions
              (mapcar #'cape-company-to-capf (list #'company-spell))))

;; Packages

(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . enzuru-hook-markdown-mode))
  :mode (("\\.md$" . markdown-mode)
         ("\\.gmi$" . markdown-mode)))

(provide 'enzuru-markdown)
