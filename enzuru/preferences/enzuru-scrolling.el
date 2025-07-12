;;; enzuru-scrolling.el --- Scrolling preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, scrolling

;;; Commentary:

;; Configuration for scrolling behavior preferences.

;;; Code:

(setq scroll-step 1
      compilation-scroll-output t
      mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't)

(provide 'enzuru-scrolling)

;;; enzuru-scrolling.el ends here
