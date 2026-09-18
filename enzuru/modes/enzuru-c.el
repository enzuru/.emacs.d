;;; enzuru-c.el --- C programming language support -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-disable-whitespace-hook ()
  (remove-hook 'before-save-hook #'whitespace-cleanup t))

(defun enzuru-configure-c-ts-mode ()
  (add-hook 'c-ts-mode-hook 'eglot-ensure)
  (add-hook 'c-ts-mode-hook #'enzuru-disable-whitespace-hook)
  (setq c-default-style "linux"))

;; Packages

(use-package c-ts-mode
  :config (enzuru-configure-c-ts-mode)
  :defer t
  :bind (:map c-ts-mode-map (("C-c d" . enzuru-man-open)))
  ;; :hook ((c-ts-mode . eglot-ensure))
  :mode (("\\.c$" . c-ts-mode)
         ("\\.h$" . c-ts-mode)))

(provide 'enzuru-c)

;;; enzuru-c.el ends here
