;;; enzuru-recent-files.el --- Recent files preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, files

;;; Commentary:

;; Configuration for recent files preferences.

;;; Code:

(recentf-mode 1)

(setq recentf-max-menu-items 100)

(provide 'enzuru-recent-files)

;;; enzuru-recent-files.el ends here
