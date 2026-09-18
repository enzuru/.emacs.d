;;; enzuru-version-control.el --- Version control configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-magit-buffer-stale-p (&optional _noconfirm)
  "Return non-nil when the current Magit buffer is on screen.

Auto-revert refreshes stale buffers, so a displayed Magit buffer
follows changes made outside of Emacs.  Buffers that no window
shows are left alone, which keeps the refresh cost bounded."
  (and (get-buffer-window (current-buffer) 'visible) t))

(defun enzuru-configure-magit-buffer ()
  (setq-local buffer-stale-function #'enzuru-magit-buffer-stale-p))

;; Packages

(use-package transient
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :demand t
  :diminish magit-auto-revert-mode
  :bind (("C-c s" . magit-status)
         ("C-c p" . magit-push-current-to-upstream))
  :hook (magit-mode . enzuru-configure-magit-buffer)
  :custom
  (vc-follow-symlinks t)
  (global-auto-revert-non-file-buffers t)
  :config
  (global-auto-revert-mode t))

(provide 'enzuru-version-control)

;;; enzuru-version-control.el ends here
