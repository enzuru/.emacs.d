;;; enzuru-terraform.el --- Terraform configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-terraform ()
  (add-hook 'terraform-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'terraform-format-buffer))))

;; Packages

(use-package terraform-doc
  :ensure t
  :defer t)

(use-package terraform-mode
  :ensure t
  :config (enzuru-configure-terraform)
  :defer t)

(provide 'enzuru-terraform)

;;; enzuru-terraform.el ends here
