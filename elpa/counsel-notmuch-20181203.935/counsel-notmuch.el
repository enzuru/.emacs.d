;;; counsel-notmuch.el --- Search emails in Notmuch asynchronously with Ivy  -*- lexical-binding: t; -*-

;; Copyright (C) 2017-2018  Alexander Fu Xi

;; Author: Alexander Fu Xi <fuxialexander@gmail.com>
;; URL: https://github.com/fuxialexander/counsel-notmuch
;; Package-Version: 20181203.935
;; Package-Commit: a4a1562935e4180c42524c51609d1283e9be0688
;; Keywords: mail
;; Version: 1.0
;; Package-Requires: ((emacs "24") (ivy "0.10.0") (notmuch "0.21") (s "1.12.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides `counsel-notmuch' function which is inspired by
;; `helm-notmuch'.
;; Simply call `counsel-notmuch' function and input your notmuch query.

;; News:
;; -2017-12-05 Initial release

;;; Code:
;;; License: GPLv3
;;
;;
;;; Code:
;;

(require 'counsel)
(require 'notmuch)
(require 's)

(defgroup counsel-notmuch nil
  "Options for counsel-notmuch."
  :group 'Notmuch)

(defcustom counsel-notmuch-path "notmuch"
  "Path to notmuch executable."
  :type 'string
  :group 'counsel-notmuch)

(defface counsel-notmuch-date-face
  '((t :inherit notmuch-search-date :background nil))
  "Default face used in tree mode face for matching messages"
  :group 'counsel-notmuch)

(defface counsel-notmuch-count-face
  '((t :inherit notmuch-search-count :background nil))
  "Default face used in tree mode face for matching messages"
  :group 'counsel-notmuch)

(defface counsel-notmuch-people-face
  '((t :inherit notmuch-search-matching-authors :background nil))
  "Default face used in tree mode face for matching messages"
  :group 'counsel-notmuch)

(defface counsel-notmuch-subject-face
  '((t :inherit notmuch-search-subject :background nil))
  "Default face used in tree mode face for matching messages"
  :group 'counsel-notmuch)


(defvar counsel-notmuch-history nil
  "History for `counsel-notmuch'.")

(defun counsel-notmuch-cmd (input)
  "Form notmuch query command using INPUT."
  (counsel-require-program counsel-notmuch-path)
  (format "notmuch search %s"
          (shell-quote-argument input))
  )

(defun counsel-notmuch-function (input)
  "Get mail from notmuch using INPUT."
  (if (< (length input) 3)
      (ivy-more-chars)
    (counsel--async-command
     (counsel-notmuch-cmd input)) '("" "working...")))

(defun counsel-notmuch-action-tree (thread &optional initial-input)
  "Open resulting THREAD in ‘notmuch-tree’ view with INITIAL-INPUT."
  (let ((thread-id (car (split-string thread "\\ +"))))
    (notmuch-tree thread-id initial-input nil)))


(defun counsel-notmuch-action-show (thread)
  "Open resulting THREAD in ‘notmuch-show’ view."
  (let ((title (concat "*counsel-notmuch-show*" (substring thread 24)))
        (thread-id (car (split-string thread "\\ +"))))
    (notmuch-show thread-id nil nil nil title)))

(defun counsel-notmuch-transformer (str)
  "Transform STR to notmuch display style."
  (when (string-match "thread:" str)
    (let* ((mid (substring str 24))
           (date (propertize (substring str 24 37) 'face 'counsel-notmuch-date-face))
           (mat (propertize
                 (substring mid (string-match "[[]" mid) (+ (string-match "[]]" mid) 1))
                 'face
                 'counsel-notmuch-count-face))
           (people
            (propertize
             (truncate-string-to-width (s-trim (nth 1 (split-string mid "[];]"))) 20)
             'face
             'counsel-notmuch-people-face))
           (subject
            (propertize
             (truncate-string-to-width (s-trim (nth 1 (split-string mid "[;]"))) (- (frame-width) 32))
             'face
             'counsel-notmuch-subject-face))
           (str (format "%s\t%10s\t%20s\t%s" date mat people subject)))
      str)))

;;;###autoload
(defun counsel-notmuch (&optional initial-input)
  "Search for your email in notmuch with INITIAL-INPUT."
  (interactive)
  (ivy-read "Notmuch Search: "
            #'counsel-notmuch-function
            :initial-input initial-input
            :dynamic-collection t
            ;; :keymap counsel-notmuch-map
            :history 'counsel-notmuch-history
            :action '(1
                      ("o" counsel-notmuch-action-show "Show")
                      ("t" counsel-notmuch-action-tree "Tree View"))
            :unwind (lambda () (counsel-delete-process))
            :caller 'counsel-notmuch))

(ivy-set-display-transformer 'counsel-notmuch 'counsel-notmuch-transformer)

(provide 'counsel-notmuch)

;;; counsel-notmuch.el ends here
