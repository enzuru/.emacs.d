;;; enzuru-web.el --- Web development configuration -*- coding: utf-8; lexical-binding: t -*-

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


;; Packages

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2)
  :mode (("\\.twig$" . web-mode)
         ("\\.erb$" . web-mode)))

(provide 'enzuru-web)

;;; enzuru-web.el ends here
