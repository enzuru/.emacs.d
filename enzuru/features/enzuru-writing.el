;;; enzuru-writing.el --- Writing and text editing configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, writing, fountain, screenplay

;;; Commentary:

;; This module configures writing tools including Fountain mode for
;; screenplay writing and distraction-free editing.

;;; Code:

;; Packages

;; (use-package olivetti
;;   :ensure t)

(use-package fountain-mode
  :ensure t
  :mode (("\\.fountain\\'" . fountain-mode-mode))
  :hook ((fountain-mode . variable-pitch-mode)
         (fountain-mode . olivetti-mode)
         (fountain-mode . auto-complete-mode)))

(provide 'enzuru-writing)

;;; enzuru-writing.el ends here
