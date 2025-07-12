;;; enzuru-customization.el --- Customization preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, customization

;;; Commentary:

;; Configuration for customization preferences.

;;; Code:

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(provide 'enzuru-customization)

;;; enzuru-customization.el ends here
