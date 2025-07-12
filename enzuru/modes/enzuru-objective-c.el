;;; enzuru-objective-c.el --- Objective-C programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, objective-c

;;; Commentary:

;; Configuration for Objective-C programming.

;;; Code:

;; Functions

(defun enzuru-buffer-contains-substring (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (search-forward string nil t))))

(defun enzuru-cocoa-open-documentation ()
  (interactive)
  (let ((foundation-url (concat "https://developer.apple.com/documentation/foundation/" (downcase (thing-at-point 'word))))
        (appkit-url (concat "https://developer.apple.com/documentation/appkit/" (downcase (thing-at-point 'word)))))
    (let ((previous-buffer (current-buffer))
          (web-result (url-retrieve-synchronously foundation-url)))
      (switch-to-buffer web-result)
      (if (enzuru-buffer-contains-substring "404 Not Found")
          (browse-url appkit-url)
        (browse-url foundation-url))
      (switch-to-buffer previous-buffer))))

;; (define-key obj-c-mode-map (kbd "C-c d") 'enzuru-cocoa-open-documentation)

(defun enzuru-configure-objc-mode ()
  (add-hook 'objc-mode-hook 'eglot-ensure))

(enzuru-configure-objc-mode)

;; Packages

(provide 'enzuru-objective-c)

;;; enzuru-objective-c.el ends here
