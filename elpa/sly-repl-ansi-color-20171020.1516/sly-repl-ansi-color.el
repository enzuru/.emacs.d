;;; sly-repl-ansi-color.el --- Add ANSI colors support to the sly mrepl.

;; Author: Javier "PuercoPop" Olaechea <pirata@gmail.com>
;;         Max Mikhanosha
;; Package-Requires: ((sly "0") (cl-lib "0.5"))
;; Package-Version: 20171020.1516
;; Package-Commit: b9cd52d1cf927bf7e08582d46ab0bcf1d4fb5048
;; Keywords: sly
;; URL: https://github.com/PuercoPop/sly-repl-ansi-color
;; Version: 0.1

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package adds ANSI colors support to the sly mrepl. It is a port of
;; slime-repl-ansi-color.el which was originally written by Max Mikhanosha.

;;; Code:
(require 'ansi-color)
(require 'sly)
(require 'cl-lib)

(define-sly-contrib sly-repl-ansi-color
  "Turn on ANSI colors in the mREPL output"
  (:authors '("Javier Olaechea" "Max Mikhanosha"))
  (:license "GPL")
  (:on-load (progn
              (sly-repl-ansi-on)
              (add-hook 'sly-mrepl-output-filter-functions
                        'sly-repl-ansi-colorize))))

(defvar sly-repl-ansi-color t
  "When Non-NIL will process ANSI colors in the lisp output")

(make-variable-buffer-local 'sly-repl-ansi-color)

(defun sly-repl-ansi-on ()
  "Set `ansi-color-for-comint-mode' to t."
  (interactive)
  (setq sly-repl-ansi-color t))

(defun sly-repl-ansi-off ()
  "Set `ansi-color-for-comint-mode' to t."
  (interactive)
  (setq sly-repl-ansi-color nil))

(defun sly-repl-ansi-colorize (string)
  (when sly-repl-ansi-color
    (with-temp-buffer
      (insert (ansi-color-apply string))
      (dotimes (char-pos (- (point-max) (point-min)))
        (let* ((char-pos (1+ char-pos))
               (prop (cl-getf (text-properties-at char-pos) 'font-lock-face)))
          (when prop
            (put-text-property char-pos (1+ char-pos) 'face prop))))
      (buffer-string))))

(provide 'sly-repl-ansi-color)
;;; sly-repl-ansi-color.el ends here
