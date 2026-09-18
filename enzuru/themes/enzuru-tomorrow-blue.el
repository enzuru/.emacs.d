;;; enzuru-tomorrow-blue.el --- Tomorrow Blue theme configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-tomorrow-blue ()
  (load-theme 'sanityinc-tomorrow-blue t)
  (set-face-attribute 'fringe nil :background "#002451" :foreground "#FFFFFF")
  (sml/apply-theme 'light)
  (set-face-background 'hl-line "#FF0000"))

;; Packages

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config (enzuru-configure-tomorrow-blue))

(provide 'enzuru-tomorrow-blue)

;;; enzuru-tomorrow-blue.el ends here
