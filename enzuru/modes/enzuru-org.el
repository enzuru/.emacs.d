;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

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
  :ensure (:host github :repo "sympodius/org-novelist")
  :custom (org-novelist-automatic-referencing-p t))

(provide 'enzuru-org)
