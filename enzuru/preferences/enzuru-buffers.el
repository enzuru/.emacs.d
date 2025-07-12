;;; enzuru-buffers.el --- Buffer management preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, buffers

;;; Commentary:

;; Configuration for buffer management preferences.

;;; Code:

;; Variables

(savehist-mode 1)
(save-place-mode 1)

;; Configuration

(defun enzuru-configure-uniquify ()
  (setq switch-to-buffer-in-dedicated-window 'pop
        kill-buffer-query-functions nil
        uniquify-buffer-name-style 'post-forward))

(enzuru-configure-uniquify)

(provide 'enzuru-buffers)

;;; enzuru-buffers.el ends here
