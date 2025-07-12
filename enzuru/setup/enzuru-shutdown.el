;;; enzuru-shutdown.el --- Shutdown behavior configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, setup

;;; Commentary:

;; This module configures Emacs shutdown behavior to disable process
;; confirmation dialogs when exiting.

;;; Code:

(setq confirm-kill-processes nil)

(provide 'enzuru-shutdown)

;;; enzuru-shutdown.el ends here
