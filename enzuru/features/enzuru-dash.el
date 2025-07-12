;;; enzuru-dash.el --- Dash documentation browser configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, documentation, dash

;;; Commentary:

;; This module configures Dash documentation browser integration.

;;; Code:

;; Packages

(use-package dash-at-point
  :ensure t
  :bind (("C-c d" . dash-at-point)))

(provide 'enzuru-dash)

;;; enzuru-dash.el ends here
