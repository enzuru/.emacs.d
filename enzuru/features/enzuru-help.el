;;; enzuru-help.el --- Help system configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-which-key ()
  (which-key-setup-side-window-right)
  (which-key-mode))

;; Packages

(use-package which-key
  :ensure t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(use-package helpful
  :ensure t
  :bind (("C-h c" . helpful-command)
         ("C-h f" . helpful-function)
         ("C-h k" . helpful-key)
         ("C-h m" . helpful-macro)
         ("C-h p" . helpful-at-point)
         ("C-h v" . helpful-variable)
         ("C-h x" . helpful-callable)))

(add-hook 'elpaca-after-init-hook 'enzuru-configure-which-key)

(provide 'enzuru-help)

;;; enzuru-help.el ends here
