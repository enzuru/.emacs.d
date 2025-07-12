;;; enzuru-clipboard.el --- Clipboard management configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, clipboard, terminal

;;; Commentary:

;; This module configures clipboard management for terminal environments
;; using clipetty for better clipboard integration.

;;; Code:

;; Packages

(use-package clipetty
  :ensure t
  :diminish clipetty-mode
  :hook (after-init . global-clipetty-mode))

(provide 'enzuru-clipboard)

;;; enzuru-clipboard.el ends here
