;;; enzuru-terminal.el --- Terminal and shell configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-eshell ()
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t)
  (add-hook 'eshell-mode-hook
            (lambda ()%
              (setq-local corfu-auto nil)
              (corfu-mode))))

(defun enzuru-configure-shell ()
  (when (file-name-nondirectory (getenv "SHELL")) "fish"
        (setq path-separator " ")
        (setq shell-switcher-mode t)))

(defun enzuru-configure-em-smart ()
  (setq eshell-where-to-jump 'begin)
  (setq eshell-review-quick-commands nil)
  (setq eshell-smart-space-goes-to-end t))

;; Packages

(use-package ghostel
  :ensure t
  :bind (("C-c e" . ghostel-project))
  :defer t)

(require 'em-smart)
(enzuru-configure-em-smart)
(enzuru-configure-shell)
(enzuru-configure-eshell)

(provide 'enzuru-terminal)

;;; enzuru-terminal.el ends here
