;;; enzuru-elixir.el --- Elixir programming language support -*- coding: utf-8; lexical-binding: t -*-

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

;; Packages

;; (use-package apprentice
;;   :ensure t
;;   :defer t)

(use-package elixir-ts-mode
  :ensure t
  :defer t
  :hook ((elixir-ts-mode . eglot-ensure)
         (elixir-ts-mode . apprentice)))

(use-package inf-elixir
  :ensure t
  :defer t
  ;; :bind (("C-c i i" . 'inf-elixir)
  ;;        ("C-c i p" . 'inf-elixir-project)
  ;;        ("C-c i l" . 'inf-elixir-send-line)
  ;;        ("C-c i r" . 'inf-elixir-send-region)
  ;;        ("C-c i b" . 'inf-elixir-send-buffer)
  ;;        ("C-c i R" . 'inf-elixir-reload-module))
  )

(provide 'enzuru-elixir)

;;; enzuru-elixir.el ends here
