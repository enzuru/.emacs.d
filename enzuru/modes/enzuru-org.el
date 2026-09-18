;;; enzuru-org.el --- Org mode configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-org ()
  (add-hook 'org-mode-hook (lambda ()
                             (add-hook 'before-save-hook #'org-update-all-dblocks nil t)))
  (setq org-agenda-files (directory-files-recursively "~/src/notes/" "\\.org$")))

(defun enzuru-org-files-by-tag (tag)
  (directory-files-recursively "~/src/notes/" (concat "^" tag "-.*\\.org$")))

(defun enzuru-hook-org-mode ()
  ;; (setq-local completion-at-point-functions (mapcar #'cape-company-to-capf (list #'company-spell)))
  )

;; Packages

(use-package org
  :ensure t
  :defer t
  :hook ((org-mode . enzuru-hook-org-mode))
  :config (enzuru-configure-org)
  :custom
  (org-log-done t)
  (org-src-fontify-natively t)
  (org-startup-folded nil)
  (org-agenda-span 'month)
  (org-deadline-warning-days 0))

(use-package org-super-agenda
  :ensure t
  :defer t
  :config (org-super-agenda-mode))

(provide 'enzuru-org)

;;; enzuru-org.el ends here
