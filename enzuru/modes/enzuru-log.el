;;; enzuru-log.el --- Log file configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: tools, logs

;;; Commentary:

;; Configuration for viewing log files.

;;; Code:

;; Packages

(use-package itail
  :hook ((itail-mode . auto-revert-mode))
  :mode (("\\log$" . itail-mode))
  :ensure t)

(provide 'enzuru-log)

;;; enzuru-log.el ends here
