;;; enzuru-bug-tracking.el --- Bug tracking tools configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, bugs, tracking, debbugs

;;; Commentary:

;; This module configures bug tracking tools, particularly Debbugs for
;; interacting with GNU bug tracking systems.

;;; Code:

;; Packages

(use-package debbugs
  :defer t
  :ensure t)

(provide 'enzuru-bug-tracking)

;;; enzuru-bug-tracking.el ends here
