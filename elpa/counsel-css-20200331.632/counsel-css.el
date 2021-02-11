;;; counsel-css.el --- stylesheet-selector-aware swiper
;;
;; Copyright (C) 2016-2020 Henrik Lissner
;;
;; Author: Henrik Lissner <http://github/hlissner>
;; Maintainer: Henrik Lissner <henrik@lissner.net>
;; Created: June 3, 2016
;; Modified: March 31, 2020
;; Version: 1.0.8
;; Package-Version: 20200331.632
;; Package-Commit: 6427dfcbda0d2bbd81db03f9d6b56b06c260ac02
;; Keywords: convenience tools counsel swiper selector css less scss
;; Homepage: https://github.com/hlissner/emacs-counsel-css
;; Package-Requires: ((emacs "24.4") (counsel "0.7.0") (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; `counsel-css` is an ivy-mode backend for css selectors (works for SCSS and
;; LESS too). It also has a hook to integrate its parser into Imenu.
;;
;;; Code:

(eval-when-compile
  (require 'cl-lib)
  (require 'subr-x)
  (require 'counsel))

(declare-function ivy-read "ivy")

(defgroup counsel-css nil
  "An counsel backend for css/scss/less selectors."
  :group 'ivy-faces)

(defface counsel-css-selector-depth-face-1
  '((((class color) (background dark)) (:foreground "#ffff00"))
    (((class color) (background light)) (:foreground "#0000ff"))
    (t (:foreground "#ffff00")))
  "Selector depth 1"
  :group 'counsel-css)

(defface counsel-css-selector-depth-face-2
  '((((class color) (background dark)) (:foreground "#ffdd00"))
    (((class color) (background light)) (:foreground "#3300ff"))
    (t (:foreground "#ffdd00")))
  "Selector depth 2"
  :group 'counsel-css)

(defface counsel-css-selector-depth-face-3
  '((((class color) (background dark)) (:foreground "#ffbb00"))
    (((class color) (background light)) (:foreground "#6600ff"))
    (t (:foreground "#ffbb00")))
  "Selector depth 3"
  :group 'counsel-css)

(defface counsel-css-selector-depth-face-4
  '((((class color) (background dark)) (:foreground "#ff9900"))
    (((class color) (background light)) (:foreground "#9900ff"))
    (t (:foreground "#ff9900")))
  "Selector depth 4"
  :group 'counsel-css)

(defface counsel-css-selector-depth-face-5
  '((((class color) (background dark)) (:foreground "#ff7700"))
    (((class color) (background light)) (:foreground "#cc00ff"))
    (t (:foreground "#ff7700")))
  "Selector depth 5"
  :group 'counsel-css)

(defface counsel-css-selector-depth-face-6
  '((((class color) (background dark)) (:foreground "#ff5500"))
    (((class color) (background light)) (:foreground "#ff00ff"))
    (t (:foreground "#ff5500")))
  "Selector depth 6"
  :group 'counsel-css)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun counsel-css--open-brace-forward (&optional bound)
  (let ((ret (re-search-forward "[^#]{" bound t)))
    (when ret
      (backward-char)
      (if (counsel-css--comment-p (point))
          (counsel-css--open-brace-forward bound)
        ret))))

(defun counsel-css--substr-last-string (text key)
  (let (match)
    (while (setq match (string-match-p key text))
      (setq text (substring text (1+ match))))
    text))

(defun counsel-css--fetch-previous-line (&optional prev noexcursion)
  "Return previous nth (PREV) line strings. If noexcursion is not-nil cursor
doesn't move."
  ;; In compressed Css without this return, it takes long time
  (if (eq 1 (line-number-at-pos))
      ""
    (or prev (setq prev 1))
    (if noexcursion (setq noexcursion (point)))
    (move-beginning-of-line (- 1 prev))
    (let ((po (point)) res)
      (move-end-of-line 1)
      (setq res (buffer-substring-no-properties po (point)))
      (if noexcursion (goto-char noexcursion))
      res)))

(defun counsel-css--comment-p (&optional pos)
  (or pos (setq pos (point)))
  (nth 4 (parse-partial-sexp (point-min) pos)))

(defun counsel-css--extract-selector ()
  "Return selector infomation at the point"
  (let ((multi "") s po1 po2 po3 str commentp)
    ;; Collect multiple selector across previous lines
    ;; (i.e. "div, \n p, \n span {...}")
    (save-excursion
      (while (string-match-p ",[\s\t]*$"
                             (setq s (counsel-css--fetch-previous-line)))
        ;; Skip commented selector (i.e. " // .blue,")
        (save-excursion
          (move-beginning-of-line 1)
          (setq po3 (point))
          (setq commentp (counsel-css--comment-p (search-forward ","))))
        (unless commentp
          (setq multi (format "%s %s" (string-trim s) multi)))))
    ;; Extract selector include one-line-nesting (i.e. "div { p {...} }")
    (save-excursion
      (skip-chars-backward "^{};\n")
      (setq po1 (point))
      (skip-chars-forward "^{")
      (setq po2 (point))
      (setq str (buffer-substring-no-properties po1 po2))
      ;; i.e. "div { .box { p"  ->  " p"
      (setq str (counsel-css--substr-last-string str "{\\|}"))
      (setq str (string-trim str))
      ;; Return (selector-name . (selector-beginning-point . selector-end-point))
      (if (equal multi "")
          (cons (format "%s" str) (cons po1 po2))
        (cons (format "%s %s" (string-trim multi) str)
              (cons po3 po2))))))

(defun counsel-css--selector-next (&optional bound)
  "Return and goto next selector."
  (when (counsel-css--open-brace-forward bound)
    (counsel-css--extract-selector)))

(defun counsel-css--selector-to-hash (&optional no-line-numbers)
  "Collect all selectors and make hash table"
  (let ((hash (make-hash-table :test #'equal))
        selector paren-beg paren-end dep max sl
        selector-name selector-beg selector-end
        selector-line)
    (save-excursion
      (goto-char (point-min))
      (while (setq selector (counsel-css--selector-next))
        (setq paren-beg (point)
              paren-end (scan-sexps paren-beg 1)
              max (cons paren-end max)
              max (mapcar (lambda (p) (if (< p paren-beg) nil p)) max)
              max (delq nil max)
              dep (length max)
              selector-name (car selector)
              selector-name
              (cl-case dep
                (1 (propertize selector-name 'face 'counsel-css-selector-depth-face-1))
                (2 (propertize selector-name 'face 'counsel-css-selector-depth-face-2))
                (3 (propertize selector-name 'face 'counsel-css-selector-depth-face-3))
                (4 (propertize selector-name 'face 'counsel-css-selector-depth-face-4))
                (5 (propertize selector-name 'face 'counsel-css-selector-depth-face-5))
                (6 (propertize selector-name 'face 'counsel-css-selector-depth-face-6)))
              selector-beg (cadr selector)
              selector-end (cddr selector)
              selector-line (line-number-at-pos selector-beg))
        (when (<= dep (length sl))
          (cl-loop repeat (- (1+ (length sl)) dep) do (pop sl)))
        (setq sl (cons selector-name sl))
        (puthash
         (if no-line-numbers
             (mapconcat #'identity (reverse sl) " ")
           (format "%s: %s"
                   (propertize (number-to-string selector-line)
                               'face 'font-lock-function-name-face)
                   (mapconcat 'identity (reverse sl) " ")))
         (list paren-beg paren-end dep selector-beg selector-end selector-line)
         hash)))
    hash))

(defun counsel-css--imenu-create-index-function (&optional no-line-numbers)
  (let ((hash (counsel-css--selector-to-hash (not no-line-numbers))))
    (cl-loop for k being hash-key in hash using (hash-values v)
             collect (cons k (nth 3 v)))))

;;;###autoload
(defun counsel-css-imenu-setup ()
  "Set up imenu to recognize css/scss/less/stylus selectors."
  (setq imenu-create-index-function #'counsel-css--imenu-create-index-function))

;;;###autoload
(defun counsel-css ()
  "Jump to a css selector."
  (interactive)
  (require 'counsel)
  (ivy-read "Selectors: "
            (counsel-css--imenu-create-index-function t)
            :action (lambda (sel) (with-ivy-window (goto-char (cdr sel))))
            :require-match t
            :caller 'counsel-css))

(provide 'counsel-css)
;;; counsel-css.el ends here
