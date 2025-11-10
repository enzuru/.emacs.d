;;; enzuru-system-monitoring.el --- System monitoring. -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: monitoring

;;; Commentary:

;; This module enables system monitoring.

;;; Code:

(use-package lemon
  :straight (lemon :fetcher git :url "https://codeberg.org/emacs-weirdware/lemon.git")
  :config (lemon-mode 1))

(provide 'enzuru-system-monitoring)

;;; enzuru-system-monitoring.el ends here
