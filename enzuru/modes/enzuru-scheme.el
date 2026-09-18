;;; enzuru-scheme.el --- Scheme programming configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-geiser ()
  (require 'geiser-guile)
  (add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))
  (add-to-list 'auto-mode-alist '("\\.guile$" . scheme-mode))
  (add-hook 'scheme-mode-hook 'turn-on-geiser-mode)
  (add-hook 'scheme-mode-hook 'lispy-mode)
  (setq geiser-debug-show-debug t)
  (define-key scheme-mode-map (kbd "C-c o") 'geiser-load-current-buffer)
  (define-key scheme-mode-map (kbd "C-x r") 'geiser-eval-region)
  (define-key scheme-mode-map (kbd "C-c d") 'geiser-doc-symbol-at-point))

(defun enzuru-configure-completing-read-geiser ()
  (require 'completing-read-geiser)
  (define-key scheme-mode-map (kbd "C-c i") 'completing-read-geiser)
  (define-key geiser-repl-mode-map (kbd "C-c i") 'completing-read-geiser))

;; Packages

(use-package geiser
  :ensure (:host gitlab :repo "emacs-geiser/geiser")
  :config (enzuru-configure-geiser))

(use-package geiser-guile
  :ensure (:host gitlab :repo "emacs-geiser/guile"))

(use-package completing-read-geiser
  :ensure (:host github :repo "enzuru/completing-read-geiser")
  :config (enzuru-configure-completing-read-geiser))

(provide 'enzuru-scheme)

;;; enzuru-scheme.el ends here
