;;; enzuru-overlay.el --- Overlay display configuration -*- coding: utf-8; lexical-binding: t -*-

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

;; Packages

(use-package eros
  :ensure t
  :config (eros-mode 1))

(use-package flyover
  :ensure (:host github :repo "konrad1977/flyover")
  :hook ((flymake-mode . flyover-mode))
  :diminish (flyover-mode)
  :custom
  (flyover-line-position-offset 0)
  (flyover-levels '(error warning info))
  (flyover-checkers '(flymake))
  (flyover-border-style 'pill)
  (flyover-info-icon "🛈")
  (flyover-warning-icon "⚠")
  (flyover-error-icon "✘")
  (flyover-background-lightness 25)
  (flyover-levels '(error warning info))
  (flyover-use-theme-colors t))

(provide 'enzuru-overlay)

;;; enzuru-overlay.el ends here
