;;; enzuru-modeline.el --- Mode line configuration -*- coding: utf-8; lexical-binding: t -*-

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

;; Configuration

(defun enzuru-configure-sml ()
  (sml/setup))

;; Packages

(use-package smart-mode-line
  :ensure t
  :custom
  (sml/mode-width 'full)
  (sml/name-width 20)
  (sml/shorten-modes t)
  (sml/no-confirm-load-theme t)
  :config (enzuru-configure-sml))

;; Variables

(column-number-mode t)

(provide 'enzuru-modeline)

;;; enzuru-modeline.el ends here
