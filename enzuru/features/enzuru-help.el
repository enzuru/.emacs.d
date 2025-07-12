;;; enzuru-help.el --- Help system configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, help, which-key, helpful

;;; Commentary:

;; This module configures the help system including Which-Key for
;; key binding discovery and Helpful for enhanced help buffers.

;;; Code:

;; Functions

(defun enzuru-configure-which-key ()
  (which-key-setup-side-window-right)
  (which-key-mode))

;; Packages

(use-package which-key
  :ensure t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(use-package helpful
  :ensure t
  :bind (("C-h c" . helpful-callable)
         ("C-h f" . helpful-function)
         ("C-h m" . helpful-macro)
         ("C-h c" . helpful-command)
         ("C-h k" . helpful-key)
         ("C-h v" . helpful-variable)
         ("C-h p" . helpful-at-point)))

(add-hook 'elpaca-after-init-hook 'enzuru-configure-which-key)

(provide 'enzuru-help)

;;; enzuru-help.el ends here
