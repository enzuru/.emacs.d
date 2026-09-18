;;; enzuru-emacs-lisp.el --- Emacs Lisp programming support -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-elisp-documentation-search ()
  (interactive)
  (describe-symbol (intern (thing-at-point 'symbol))))

(defun enzuru-configure-emacs-lisp-mode ()
  (define-key emacs-lisp-mode-map (kbd "C-c d") 'enzuru-elisp-documentation-search)
  (define-key emacs-lisp-mode-map (kbd "C-c o") 'eval-buffer)
  (define-key emacs-lisp-mode-map (kbd "C-c i") 'describe-symbol))

(defun enzuru-run-ert-tests ()
  (let ((window (selected-window)))
    (eval-buffer)
    (ert-run-tests-interactively t)
    (select-window window)))

;; Packages

(use-package checkdoc
  :defer t)

(use-package package-build
  :ensure t
  :defer t)

(use-package package-lint
  :ensure t
  :defer t)

(use-package package-lint-flymake
  :ensure t
  :hook ((emacs-lisp-mode . package-lint-flymake-setup))
  :defer t)

(add-hook 'elpaca-after-init-hook 'eldoc-mode)

(enzuru-configure-emacs-lisp-mode)

(provide 'enzuru-emacs-lisp)

;;; enzuru-emacs-lisp.el ends here
