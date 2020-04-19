;;; company-quickhelp-terminal.el --- Terminal support for `company-quickhelp'  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Shen, Jen-Chieh
;; Created date 2019-12-09 23:06:42

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Terminal support for `company-quickhelp'.
;; Keyword: terminal extends support tip help
;; Version: 0.0.2
;; Package-Version: 20200309.245
;; Package-Requires: ((emacs "24.4") (company-quickhelp "2.2.0") (popup "0.5.3"))
;; URL: https://github.com/jcs090218/company-quickhelp-terminal

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
  :link '(url-link :tag "Repository" "https://github.com/jcs090218/company-quickhelp-terminal"))


(defun company-quickhelp-terminal--show ()
  "Override `company-quickhelp--show' function from `company-quickhelp'."
  (when (company-quickhelp-pos-tip-available-p)
    (company-quickhelp--cancel-timer)
    (while-no-input
      (let* ((selected (nth company-selection company-candidates))
             (doc (let ((inhibit-message t))
                    (company-quickhelp--doc selected)))
             (width 80)
             (timeout 300)
             (ovl company-pseudo-tooltip-overlay)
             (overlay-width (* (frame-char-width)
                               (if ovl (overlay-get ovl 'company-width) 0)))
             (overlay-position (* (frame-char-width)
                                  (- (if ovl (overlay-get ovl 'company-column) 1) 1)))
             (x-gtk-use-system-tooltips nil)
             (fg-bg `(,company-quickhelp-color-foreground
                      . ,company-quickhelp-color-background)))
        (when (and ovl doc)
          (with-no-warnings
            (if company-quickhelp-use-propertized-text
                (let* ((frame (window-frame (selected-window)))
                       (max-width (pos-tip-x-display-width frame))
                       (max-height (pos-tip-x-display-height frame))
                       (w-h (pos-tip-string-width-height doc)))
                  (cond
                   ((> (car w-h) width)
                    (setq doc (pos-tip-fill-string doc width nil 'none nil max-height)
                          w-h (pos-tip-string-width-height doc)))
                   ((or (> (car w-h) max-width)
                        (> (cdr w-h) max-height))
                    (setq doc (pos-tip-truncate-string doc max-width max-height)
                          w-h (pos-tip-string-width-height doc))))
                  (if (display-graphic-p)
                      (pos-tip-show-no-propertize doc fg-bg (overlay-start ovl) nil timeout
                                                  (pos-tip-tooltip-width (car w-h) (frame-char-width frame))
                                                  (pos-tip-tooltip-height (cdr w-h) (frame-char-height frame) frame)
                                                  nil (+ overlay-width overlay-position) 1)
                    (popup-tip doc :point (overlay-start ovl)
                               :width (pos-tip-tooltip-width (car w-h) (frame-char-width frame))
                               :height (pos-tip-tooltip-height (cdr w-h) (frame-char-height frame) frame)
                               :nostrip nil)))
              (if (display-graphic-p)
                  (pos-tip-show doc fg-bg (overlay-start ovl) nil timeout width nil
                                (+ overlay-width overlay-position) 1)
                (popup-tip doc :point (overlay-start ovl)
                           :width width
                           :nostrip t)))))))))

(defun company-quickhelp-terminal-pos-tip-available-p ()
  "Override `company-quickhelp-pos-tip-available-p' function from `company-quickhelp'."
  (and
   (fboundp 'x-hide-tip)
   (fboundp 'x-show-tip)))


(defun company-quickhelp-terminal--enable ()
  "Enable `company-quickhelp-terminal'."
  (advice-add 'company-quickhelp--show :override #'company-quickhelp-terminal--show)
  (advice-add 'company-quickhelp-pos-tip-available-p :override #'company-quickhelp-terminal-pos-tip-available-p))

(defun company-quickhelp-terminal--disable ()
  "Disable `company-quickhelp-terminalw'."
  (advice-remove 'company-quickhelp--show #'company-quickhelp-terminal--show)
  (advice-remove 'company-quickhelp-pos-tip-available-p #'company-quickhelp-terminal-pos-tip-available-p))

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
