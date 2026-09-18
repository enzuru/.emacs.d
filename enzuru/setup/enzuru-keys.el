;;; enzuru-keys.el --- Global key bindings configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-volatile-kill-buffer ()
  "Kill current buffer unconditionally."
  (interactive)
  (let ((buffer-modified-p nil))
    (kill-buffer (current-buffer))))

(defun enzuru-set-global-keys ()
  (global-set-key (kbd "C-c i") 'describe-symbol)
  (global-set-key (kbd "C-c o") 'compile)
  (global-set-key (kbd "C-c k") 'enzuru-volatile-kill-buffer)
  (global-set-key (kbd "C-c r") 'replace-string)
  (global-set-key (kbd "C-c t") 'tab-bar-select-tab-by-name)
  (global-set-key (kbd "C-c <left>") 'previous-buffer)
  (global-set-key (kbd "C-c <right>") 'next-buffer)
  (global-set-key (kbd "C-c <up>") 'beginning-of-buffer)
  (global-set-key (kbd "C-c <down>") 'end-of-buffer))

;; (enzuru-set-global-keys)
;; (add-hook 'elpaca-after-init-hook 'enzuru-set-global-keys)
;; (add-hook 'after-init-hook 'enzuru-set-global-keys)
;; (add-hook 'elpaca-after-init-hook 'enzuru-configure-completing-read-sly)
(run-at-time "5 sec" nil 'enzuru-set-global-keys)
;;(add-hook 'after-init-hook 'enzuru-configure-completing-read-sly)
;;(add-hook 'elpaca-after-init-hook 'which-key-mode)

(provide 'enzuru-keys)

;;; enzuru-keys.el ends here
