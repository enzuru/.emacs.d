;;; enzuru-objective-c.el --- Objective-C programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2012-2026 Elias Khanzada

;; SPDX-License-Identifier: GPL-3.0-or-later

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
