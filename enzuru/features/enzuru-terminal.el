;;; enzuru-terminal.el --- Terminal and shell configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-eshell ()
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t)
  (add-hook 'eshell-mode-hook
            (lambda ()%
              (setq-local corfu-auto nil)
              (corfu-mode))))

(defun enzuru-configure-shell ()
  (when (file-name-nondirectory (getenv "SHELL")) "fish"
        (setq path-separator " ")
        (setq shell-switcher-mode t)))

(defun enzuru-configure-em-smart ()
  (setq eshell-where-to-jump 'begin)
  (setq eshell-review-quick-commands nil)
  (setq eshell-smart-space-goes-to-end t))

;; Packages

(use-package ghostel
  :ensure t
  :bind (("C-c e" . ghostel-project))
  :defer t)

(require 'em-smart)
(enzuru-configure-em-smart)
(enzuru-configure-shell)
(enzuru-configure-eshell)

(provide 'enzuru-terminal)

;;; enzuru-terminal.el ends here
