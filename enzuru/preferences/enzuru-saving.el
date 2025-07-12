;;; enzuru-saving.el --- File saving preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, files

;;; Commentary:

;; Configuration for file saving preferences.

;;; Code:

(setq make-backup-files nil)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'enzuru-saving)

;;; enzuru-saving.el ends here
