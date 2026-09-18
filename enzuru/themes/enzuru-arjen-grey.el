;;; enzuru-arjen-grey.el --- Arjen Grey theme configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-arjen-grey-theme ()
  (load-theme 'arjen-grey t)
  (set-face-background 'hl-line "#000000")
  (set-face-background 'mode-line-inactive "#2A2F38")
  (custom-theme-set-variables
   'arjen-grey
   '(main-line-color1 "#191919")
   '(main-line-color2 "#111111")
   '(fringe-mode 6 nil (fringe))
   '(hl-line ((t (:inherit highlight :background "#4B0082")))))
  (sml/apply-theme 'respectful))

;; Packages

(use-package arjen-grey-theme
  :ensure (:host github :repo "credmp/arjen-grey-theme")
  :config (enzuru-configure-arjen-grey-theme))

(provide 'enzuru-arjen-grey)

;;; enzuru-arjen-grey.el ends here
