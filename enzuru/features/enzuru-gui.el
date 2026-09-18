;;; enzuru-gui.el --- GUI appearance and theme configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-minimalism ()
  (fringe-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun enzuru-configure-operating-systems ()
  (if (eq system-type 'darwin)
      (require 'enzuru-timu-macos))
  (if (eq system-type 'windows-nt)
      (require 'enzuru-arjen-grey))
  (if (eq (enzuru-uname) 'FreeBSD)
      (require 'enzuru-zenburn))
  (if (eq (enzuru-uname) 'OpenBSD)
      (require 'enzuru-omtose-darker))
  (if (eq system-type 'gnu/linux)
      (require 'enzuru-catppuccin)))

(enzuru-configure-minimalism)
;; (enzuru-configure-operating-systems)

(provide 'enzuru-gui)

;;; enzuru-gui.el ends here
