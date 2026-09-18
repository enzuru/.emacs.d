;;; enzuru-arrangements.el --- Window and tab arrangements configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-activities ()
  (activities-mode)
  (activities-tabs-mode))

(defun enzuru-tab-exists-p (tab-name)
  "Check if a tab exists with the given TAB-NAME."
  (catch 'tab-exists
    (dolist (tab (tab-bar-tabs))
      (when (string-equal (alist-get 'name tab) tab-name)
        (throw 'tab-exists t))) nil))

(defun enzuru-setup-tab-squares (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args)))
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-vertically)
      (switch-to-buffer four))))

(defun enzuru-setup-tab (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args))
        (five (nth 3 args))
        (six (nth 4 args))
        (seven (nth 5 args))
        (eight (nth 6 args)))
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer four))
    (when (> amount 4)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer five))
    (when (> amount 5)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer six))
    (when (> amount 6)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer seven))
    (when (> amount 8)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer eight))))

;; Packages

(use-package activities
  :ensure (:host github :repo "alphapapa/activities.el")
  :config (enzuru-configure-activities)
  :custom
  (activities-bookmark-store t))

(provide 'enzuru-arrangements)

;;; enzuru-arrangements.el ends here
