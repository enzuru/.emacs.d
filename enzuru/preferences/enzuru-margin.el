;;; enzuru-margin.el --- Margin preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, ui, margins

;;; Commentary:

;; Configuration for window margin preferences.

;;; Code:

(setq-default top-margin-width 2 bottom-margin-height 2 left-margin-width 2 right-margin-width 2)

(set-window-buffer nil (current-buffer))

(provide 'enzuru-margin)

;;; enzuru-margin.el ends here
