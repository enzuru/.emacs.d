;;; enzuru-clojure.el --- Clojure programming language support -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-cider ()
  (cider-auto-test-mode 1))

(defun enzuru-configure-completing-read-cider ()
  (require 'completing-read-cider)
  (define-key clojure-mode-map (kbd "C-c i") 'completing-read-cider)
  (define-key cider-repl-mode-map (kbd "C-c i") 'completing-read-cider))

;; Packages

(use-package clojure-ts-mode
  :ensure t
  :defer t)

(use-package cider
  :ensure t
  :defer t
  :custom
  (cider-test-show-report-on-success t)
  (cider-session-name-template "%J:%h")
  :config (enzuru-configure-cider)
  :bind (:map clojure-mode-map
              ("C-c d" . cider-doc)
              ("C-c o" . cider-eval-buffer)))

(use-package completing-read-cider
  :ensure (:host github :repo "enzuru/completing-read-cider")
  :config (enzuru-configure-completing-read-cider))

(provide 'enzuru-clojure)

;;; enzuru-clojure.el ends here
