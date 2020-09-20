;;; company-quickhelp-terminal.el --- Terminal support for `company-quickhelp'  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Shen, Jen-Chieh
;; Created date 2019-12-09 23:06:42

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Terminal support for `company-quickhelp'.
;; Keyword: terminal extends support tip help
;; Version: 0.1.1
;; Package-Version: 20200904.305
;; Package-Commit: c2e077e8d32610f80a506c410ab51a4ba747a47f
;; Package-Requires: ((emacs "24.4") (company-quickhelp "2.2.0") (popup "0.5.3"))
;; URL: https://github.com/jcs-elpa/company-quickhelp-terminal

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Terminal support for `company-quickhelp'.
;;

;;; Code:

(require 'company-quickhelp)
(require 'popup)

(defgroup company-quickhelp-terminal nil
  "Terminal support for `company-quickhelp'."
  :prefix "company-quickhelp-terminal-"
  :group 'tools
  :link '(url-link :tag "Repository" "https://github.com/jcs-elpa/company-quickhelp-terminal"))

;;; Core

(defun company-quickhelp-terminal--pos-tip-show-no-propertize
    (string &optional tip-color pos window timeout pixel-width pixel-height frame-coordinates dx dy)
  "Override `pos-tip-show-no-propertize' function from `pos-tip'."
  (popup-tip string :point (overlay-start company-pseudo-tooltip-overlay)
             :width pixel-width :height pixel-height :nostrip nil))

(defun company-quickhelp-terminal--pos-tip-show
    (string &optional tip-color pos window timeout width frame-coordinates dx dy)
  "Override `pos-tip-show' function from `pos-tip'."
  (popup-tip string :point (overlay-start company-pseudo-tooltip-overlay)
             :width width :nostrip t))

(defun company-quickhelp-terminal--pos-tip-available-p ()
  "Override `company-quickhelp-pos-tip-available-p' function from `company-quickhelp'."
  (and
   (fboundp 'x-hide-tip)
   (fboundp 'x-show-tip)))

;;; Entry

(defun company-quickhelp-terminal--enable ()
  "Enable `company-quickhelp-terminal'."
  (advice-add 'pos-tip-show :override #'company-quickhelp-terminal--pos-tip-show)
  (advice-add 'pos-tip-show-no-propertize :override #'company-quickhelp-terminal--pos-tip-show-no-propertize)
  (advice-add 'company-quickhelp-pos-tip-available-p :override #'company-quickhelp-terminal--pos-tip-available-p))

(defun company-quickhelp-terminal--disable ()
  "Disable `company-quickhelp-terminalw'."
  (advice-remove 'pos-tip-show #'company-quickhelp-terminal--pos-tip-show)
  (advice-remove 'pos-tip-show-no-propertize #'company-quickhelp-terminal--pos-tip-show-no-propertize)
  (advice-remove 'company-quickhelp-pos-tip-available-p #'company-quickhelp-terminal--pos-tip-available-p))

;;;###autoload
(define-minor-mode company-quickhelp-terminal-mode
  "Minor mode 'company-quickhelp-terminal-mode'."
  :global t
  :require 'company-quickhelp-terminal
  :group 'company-quickhelp-terminal
  (if company-quickhelp-terminal-mode
      (company-quickhelp-terminal--enable)
    (company-quickhelp-terminal--disable)))

(provide 'company-quickhelp-terminal)
;;; company-quickhelp-terminal.el ends here
