;;; enzuru-haskell.el --- Haskell programming configuration -*- coding: utf-8; lexical-binding: t -*-

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

(defun enzuru-configure-haskell-ts-mode ()
  (add-hook 'haskell-ts-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-ts-mode-hook 'turn-on-haskell-indent)
  (put 'downcase-region 'disabled nil))

(defun enzuru-haskell-hoogle ()
  (interactive)
  (haskell-hoogle (haskell-ident-at-point)))

;; Packages

(use-package haskell-mode
  :ensure t
  :defer t
  :hook ((haskell-mode . eglot-ensure))
  :mode (("\\.hs$" . haskell-mode)
         ("\\.lhs$" . haskell-mode))
  :bind ((:map haskell-mode-map
               ("C-c d" . enzuru-haskell-hoogle))))

;; (use-package haskell-ts-mode
;;   :ensure t
;;   :defer t
;;   :config (enzuru-configure-haskell-ts-mode)
;;   :hook ((haskell-ts-mode . eglot-ensure)))

(provide 'enzuru-haskell)

;;; enzuru-haskell.el ends here
