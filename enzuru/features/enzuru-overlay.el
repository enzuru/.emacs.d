;;; enzuru-overlay.el --- Overlay display configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, overlay, eros

;;; Commentary:

;; This module configures overlay display features like Eros for
;; showing evaluation results inline.

;;; Code:

;; Packages

(use-package eros
  :ensure t
  :config (eros-mode 1))

(provide 'enzuru-overlay)

;;; enzuru-overlay.el ends here
