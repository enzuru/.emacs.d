;;; mime-vcard.el --- mime-view content filter for vCard.

;; Copyright (C) 2000 Free Software Foundation, Inc.

;; Author: Daiki Ueno <ueno@unixuser.org>
;; Keywords: vCard, MIME, multimedia, mail, news

;; This file is part of SEMI (Sample of Elastic MIME Interfaces).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Commentary:
;; 

;;; Code:

(require 'vcard)

(defvar mime-display-text/vcard-hook nil)

(defun mime-display-text/vcard (entity situation)
  (save-restriction
    (narrow-to-region (point-max)(point-max))
    (insert
     (string-as-multibyte
      (vcard-pretty-print
       (vcard-parse-string
	(mime-entity-content entity)
	#'vcard-standard-filter))))
    (if (not (eq (char-after (1- (point))) ?\n))
        (insert "\n"))
    (mime-add-url-buttons)
    (run-hooks 'mime-display-text/vcard-hook)))

(provide 'mime-vcard)

;;; mime-vcard.el ends here
