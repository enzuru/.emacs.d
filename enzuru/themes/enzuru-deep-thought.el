;;; enzuru-deep-thought.el --- Deep Thought theme configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-deep-thought-theme ()
  (load-theme 'deep-thought t)
  (sml/apply-theme 'respectful)
  (set-face-attribute 'fringe nil :background "#000F14" :foreground "#FFFFFF")
  (set-face-attribute 'vertical-border nil :foreground "#000F14")
  (custom-set-faces
   '(mode-line ((t (:background "#001520" :foreground "#FFFFFF" ))))
   '(mode-line-inactive ((t (:inherit mode-line :background "#001520" :foreground "gray40")))))
  )

;; Packages

(use-package deep-thought-theme
  :ensure t (:host github :repo "enzuru/emacs-deep-thought-theme")
  :config (enzuru-configure-deep-thought-theme))

(provide 'enzuru-deep-thought)

;;; enzuru-deep-thought.el ends here
