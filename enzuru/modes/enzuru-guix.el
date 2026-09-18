;;; enzuru-guix.el --- GNU Guix package manager integration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-upgrade ()
  (interactive)
  (elpaca-pull-all)
  (elpaca-write-lock-file elpaca-lock-file)
  (async-shell-command "~/bin/guix-upgrade" "*guix-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/stumpwm && git pull" "*stumpwm-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/clx-truetype && git pull" "*truetype-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/zpb-ttf && git pull" "*zpb-ttf-upgrade*")
  (async-shell-command "cd ~/.stumpwm.d/modules && git pull" "*stumpwm-modules-upgrade*")
  (enzuru-setup-tab "upgrading"
                    "*stumpwm-upgrade*" "*truetype-upgrade*" "*guix-upgrade*"  "*Messages*"
                    "*stumpwm-modules-upgrade*" "*zpb-ttf-upgrade*"))

(defun enzuru-reboot ()
  (interactive)
  (async-shell-command "sudo reboot"))

(provide 'enzuru-guix)

;;; enzuru-guix.el ends here
