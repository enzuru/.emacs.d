;;; enzuru-workspaces.el --- Buffer-isolated workspace configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defvar enzuru-workspace-session-directory
  (locate-user-emacs-file "sessions/")
  "Directory that holds the saved workspace sessions.")

(defun enzuru-workspace-exists-p (name)
  "Check if a workspace exists with the given NAME."
  (and (member name (tabspaces--list-tabspaces)) t))

(defun enzuru-workspace-switch-or-create (name)
  "Switch to the workspace named NAME, and create it when it is missing.

A new workspace starts on the scratch buffer, so that it does not
inherit the buffers of the workspace it was created from."
  (let ((tab-bar-new-tab-choice (lambda () (get-buffer-create "*scratch*"))))
    (tabspaces-switch-or-create-workspace name)))

(defun enzuru-configure-consult-workspaces ()
  "Scope `consult-buffer' to the buffers of the current workspace.

Buffers from the other workspaces stay available under the `o' narrow
key of `consult-buffer'."
  (setq consult-buffer-list-function #'consult--frame-buffer-list))

(defun enzuru-configure-tabspaces ()
  (make-directory enzuru-workspace-session-directory t)
  (tabspaces-mode)
  (with-eval-after-load 'consult (enzuru-configure-consult-workspaces)))

;; Packages

(use-package tabspaces
  :ensure t
  :demand t
  :config (enzuru-configure-tabspaces)
  :custom
  (tabspaces-default-tab "Default")
  (tabspaces-include-buffers '("*scratch*" "*Messages*"))
  (tabspaces-initialize-project-with-todo nil)
  (tabspaces-session nil)
  (tabspaces-session-auto-restore nil)
  (tabspaces-session-file
   (expand-file-name "tabsession.el" enzuru-workspace-session-directory))
  (tabspaces-session-project-session-store enzuru-workspace-session-directory)
  (tabspaces-use-filtered-buffers-as-default t))

(provide 'enzuru-workspaces)

;;; enzuru-workspaces.el ends here
