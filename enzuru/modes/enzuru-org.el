;;; enzuru-org.el --- Org mode configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-org ()
  (add-hook 'org-mode-hook (lambda ()
                             (add-hook 'before-save-hook #'org-update-all-dblocks nil t)))
  (setq org-agenda-files (directory-files-recursively "~/src/notes/" "\\.org$")))

(defun enzuru-org-files-by-tag (tag)
  (directory-files-recursively "~/src/notes/" (concat "^" tag "-.*\\.org$")))

(defun enzuru-hook-org-mode ()
  ;; (setq-local completion-at-point-functions (mapcar #'cape-company-to-capf (list #'company-spell)))
  )

;; Packages

(use-package org
  :ensure t t
  :hook ((org-mode . enzuru-hook-org-mode))
  :config (enzuru-configure-org)
  :custom
  (org-log-done t)
  (org-src-fontify-natively t)
  (org-startup-folded nil)
  (org-agenda-span 'month)
  (org-deadline-warning-days 0))

(use-package org-super-agenda
  :ensure t
  :defer t
  :config (org-super-agenda-mode))

(provide 'enzuru-org)

;;; enzuru-org.el ends here
