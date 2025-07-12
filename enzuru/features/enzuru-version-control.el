;;; enzuru-version-control.el --- Version control configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, version-control, git, magit

;;; Commentary:

;; This module configures version control tools including Magit for
;; Git integration.

;;; Code:

;; Packages

(use-package transient
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :bind (("C-c s" . magit-status)
         ("C-c p" . magit-push-current-to-upstream))
  :custom
  (vc-follow-symlinks t)
  :config
  (global-auto-revert-mode t))

(provide 'enzuru-version-control)

;;; enzuru-version-control.el ends here
