;;; enzuru-typescript.el --- TypeScript programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, typescript

;;; Commentary:

;; Configuration for TypeScript programming.

;;; Code:

;; Configuration

(defun enzuru-configure-tide ()
  (tide-setup)
  (tide-hl-identifier-mode +1))


;; Packages

(use-package tide
  :ensure t
  :hook ((typescript-ts-mode . enzuru-configure-tide)))

(use-package typescript-ts-mode
  :defer t
  :custom
  (typescript-indent-level 2))

(provide 'enzuru-typescript)

;;; enzuru-typescript.el ends here
