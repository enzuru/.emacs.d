;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-org ()
  (setq org-agenda-files (directory-files "~/" t ".org$" t)
        org-log-done t
        org-src-fontify-natively t
        org-startup-folded nil))

;; Packages

(use-package org
  :ensure t
  :defer t
  :bind (:map org-mode-map
              ("C-c b" . org-insert-heading))
  :config (enzuru-configure-org))

(provide 'enzuru-org)
