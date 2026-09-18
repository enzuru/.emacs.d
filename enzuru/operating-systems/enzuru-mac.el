;;; enzuru-mac.el --- macOS specific configuration -*- coding: utf-8; lexical-binding: t -*-

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

(require 'enzuru-dash)

;; Variables

(setq mac-command-modifier 'control
      locate-command "mdfind"
      consult-locate-args "mdfind"
      inferior-lisp-program "/opt/homebrew/bin/sbcl"
      locate-make-command-line (lambda (ss) (list locate-command "-name" ss)))

(menu-bar-mode)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Faces

(set-face-attribute 'default nil
                    :family "Monaco" :height 150 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Bookerly" :height 135 :weight 'normal)

;; Fullscreen

;;(add-to-list 'default-frame-alist '(fullscreen . fullboth))
;;(setq ns-use-native-fullscreen t)

;; Functions

(defun enzuru-configure-osx-browse ()
  (setq browse-url-browser-function 'osx-browse-url-safari))

;; Packages

(use-package osx-browse
  :ensure t
  :defer t
  :config (enzuru-configure-osx-browse))

(provide 'enzuru-mac)

;;; enzuru-mac.el ends here
