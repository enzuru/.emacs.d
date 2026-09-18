;;; enzuru-go.el --- Go programming language support -*- coding: utf-8; lexical-binding: t -*-

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

(use-package go-ts-mode
  :defer t
  :bind (:map go-ts-mode-map (("C-c d" . godoc-at-point)))
  :hook ((go-ts-mode . eglot-ensure)))

(use-package go-playground
  :ensure t
  :defer t)

(provide 'enzuru-go)

;;; enzuru-go.el ends here
