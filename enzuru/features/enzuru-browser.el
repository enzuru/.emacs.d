;;; enzuru-browser.el --- Web browsing configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, web, browser, eww

;;; Commentary:

;; This module configures web browsing in Emacs using EWW and provides
;; custom search functionality.

;;; Code:

;; Configuration

(defun enzuru-search ()
  (interactive)
  (eww-browse-url (concat "https://search.marginalia.nu/search?profile=yolo&js=no-js&query=" (read-string "Search: "))))

(setq browse-url-browser-function 'eww-browse-url)
(global-set-key (kbd "") 'enzuru-search)

(provide 'enzuru-browser)

;;; enzuru-browser.el ends here
