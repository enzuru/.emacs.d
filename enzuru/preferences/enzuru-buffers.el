;;; enzuru-buffers.el --- Buffer management preferences configuration -*- coding: utf-8; lexical-binding: t -*-

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

;; Variables

(save-place-mode 1)

;; Configuration

(defun enzuru-configure-uniquify ()
  (setq switch-to-buffer-in-dedicated-window 'pop
        kill-buffer-query-functions nil
        uniquify-buffer-name-style 'post-forward))

(enzuru-configure-uniquify)

(provide 'enzuru-buffers)

;;; enzuru-buffers.el ends here
