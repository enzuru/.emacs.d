;;; enzuru-javascript.el --- JavaScript programming configuration -*- coding: utf-8; lexical-binding: t -*-

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


(defun enzuru-configure-mmm-mode ()
  (add-hook 'mmm-mode-hook
            (lambda ()
              (set-face-background 'mmm-default-submode-face nil))))

;; Packages

(use-package indium
  :ensure t
  :defer t)

(use-package js2-mode
  :ensure t
  :defer t
  :hook ((js2-mode . eglot-ensure))
  :custom
  (js2-basic-offset 2)
  (js2-strict-trailing-comma-warning nil)
  (js2-strict-missing-semi-warning nil)
  (js-indent-level 2))

(use-package mmm-mode
  :ensure t
  :defer t
  :config (enzuru-configure-mmm-mode))

(use-package js
  :ensure nil
  :defer t
  :mode (("\\.jsx?\\'" . js-ts-mode))
  :hook ((js-ts-mode . eglot-ensure)))

(use-package vue-mode
  :ensure t
  :defer t
  :mode (("\\.vue\\'" . vue-mode)))

(provide 'enzuru-javascript)

;;; enzuru-javascript.el ends here
