;;; enzuru-org.el --- Org mode configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions
(defun enzuru-configure-org ()
  (setq org-agenda-files (directory-files-recursively "~/src/notes/" "\\.org$")))

(defun enzuru-org-files-by-tag (tag)
  (directory-files-recursively "~/src/notes/" (concat "^" tag "-.*\\.org$")))

(defun enzuru-hook-org-mode ()
  ;; (setq-local completion-at-point-functions (mapcar #'cape-company-to-capf (list #'company-spell)))
  )

;; Packages

(use-package org
  :ensure t
  :defer t
  :hook ((org-mode . hyperbole-mode)
         (org-mode . enzuru-hook-org-mode))
  :config (enzuru-configure-org)
  :custom
  (org-log-done t)
  (org-src-fontify-natively t)
  (org-startup-folded nil))

(use-package org-novelist
  :defer t
  :ensure (:host github :repo "enzuru/org-novelist" :branch "zerop-org-next-visible-heading")
  :custom (org-novelist-automatic-referencing-p t))

(provide 'enzuru-org)

;;; enzuru-org.el ends here
