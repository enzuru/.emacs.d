;;; enzuru-common-lisp.el --- Common Lisp programming language support -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-sly-repl-ansi-color ()
  (add-to-list 'sly-contribs 'sly-repl-ansi-color))

(defun enzuru-sly-describe-symbol-at-point ()
  (interactive)
  (sly-describe-symbol (word-at-point)))

(defun enzuru-configure-completing-read-sly ()
  (require 'completing-read-sly)
  (define-key lisp-mode-map (kbd "C-c i") 'completing-read-sly)
  (add-hook 'sly-mode-hook (lambda ()
                             (define-key sly-mode-map (kbd "C-c i") 'completing-read-sly))))

(defun enzuru-sly-eval-to-repl ()
  (interactive)
  (sly-eval-buffer)
  (switch-to-buffer-other-window "*sly-mrepl for sbcl*")
  (end-of-buffer))

;; Packages

(use-package sly
  :ensure t
  :bind ((:map sly-mode-map
               ("C-c i" . completing-read-sly)
               :map lisp-mode-map
               ("C-c d" . enzuru-sly-describe-symbol-at-point)
               ("C-c o" . enzuru-sly-eval-to-repl)
               ("C-c i" . completing-read-sly)
               ("C-x r" . sly-eval-region))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(use-package sly-repl-ansi-color
  :ensure (:host github :repo "PuercoPop/sly-repl-ansi-color")
  :config (enzuru-configure-sly-repl-ansi-color))

(use-package completing-read-sly
  :ensure (:host github :repo "enzuru/completing-read-sly")
  :defer t
  :config (enzuru-configure-completing-read-sly))

(add-hook 'elpaca-after-init-hook 'enzuru-configure-completing-read-sly)

(provide 'enzuru-common-lisp)

;;; enzuru-common-lisp.el ends here
