;;; mime-mac.el --- Playback processing module for Mac OS X

;; Copyright (C) 2010 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;; Keywords: MIME, multimedia, mail, news

;; This file is part of SEMI (Secretariat of Emacs MIME Interfaces).

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

;;; Code:

(require 'mime-play)

(defun mime-mac-save-and-play-with-open (entity situation)
  (let ((filename
	 (mime-save-content entity situation)))
    (call-process "open" nil nil nil filename)))

(defun mime-mac-save-and-play-with-preview (entity situation)
  (let ((filename
	 (mime-save-content entity situation)))
    (call-process "open" nil nil nil
		  "-a" "/Applications/Preview.app"
		  filename)))

;; (mime-add-condition
;;  'action
;;  '((type . application)
;;    (method . mime-mac-save-and-play-with-open))
;;  'strict)

;; (mime-add-condition
;;  'action
;;  '((type . application)(subtype . pdf)
;;    (method . mime-mac-save-and-play-with-preview))
;;  'strict)


;;; @ end
;;;

(provide 'mime-mac)

;;; mime-mac.el ends here
