;;; enzuru-org.el --- Org mode configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: tools, org

;;; Commentary:

;; Configuration for Org mode.

;;; Code:

;; Functions
(defun enzuru-configure-org ()
  (setq org-agenda-files (directory-files-recursively "~/src/notes/" "\\.org$")
        org-log-done t
        org-src-fontify-natively t
        org-startup-folded nil))

(defun enzuru-hook-org-mode ()
  ;; (setq-local completion-at-point-functions (mapcar #'cape-company-to-capf (list #'company-spell)))
  )

;; Packages

(use-package org
  :ensure t
  :defer t
  :hook ((org-mode . hyperbole-mode)
         (org-mode . enzuru-hook-org-mode))
  :custom
  (org-agenda-files (directory-files "~/" t ".org$" t))
  (org-log-done t)
  (org-src-fontify-natively t)
  (org-startup-folded nil))

(use-package org-novelist
  :defer t
  :ensure (:host github :repo "enzuru/org-novelist" :branch "zerop-org-next-visible-heading")
  :custom (org-novelist-automatic-referencing-p t))

(provide 'enzuru-org)

;;; enzuru-org.el ends here
