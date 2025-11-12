;;; enzuru-digital-garden.el --- Tools for managing a digital garden -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(use-package org-roam
  :ensure t
  :config (org-roam-db-autosync-mode)
  :custom
  (org-roam-directory (file-truename "~/src/lisp-user-space"))
  (org-roam-db-location (file-truename "~/src/lisp-user-space/roam.db")))

(provide 'enzuru-digital-garden)

;;; enzuru-digital-garden.el ends here
