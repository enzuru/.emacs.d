;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-elscreen ()
  (elscreen-start)
  (setq elscreen-display-tab nil))

(defun enzuru-configure-winner-mode ()
  (winner-mode))

;; Packages

(use-package elscreen
  :ensure t
  :config (enzuru-configure-elscreen))

(enzuru-configure-winner-mode)

(provide 'enzuru-frames)
