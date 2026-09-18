;;; enzuru-frames.el --- Frame and window preferences configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-tab-bar-mode ()
  (tab-bar-mode)
  (define-prefix-command 'tab-map)
  (global-set-key (kbd "C-z") 'tab-map)
  (global-set-key (kbd "C-z c") 'tab-bar-new-tab)
  (global-set-key (kbd "C-z n") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z p") 'tab-bar-switch-to-next-tab)
  (global-set-key (kbd "C-z k") 'tab-bar-close-tab))

(defun enzuru-configure-winner-mode ()
  (winner-mode 1))

;; Packages

(use-package vim-tab-bar
  :ensure t
  :config (vim-tab-bar-mode))

;; (enzuru-load-counsel-tabs)
(enzuru-configure-tab-bar-mode)
(enzuru-configure-winner-mode)

(provide 'enzuru-frames)

;;; enzuru-frames.el ends here
