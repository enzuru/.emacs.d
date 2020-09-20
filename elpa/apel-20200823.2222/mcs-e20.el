;;; mcs-e20.el --- MIME charset implementation for Emacs 20.1 and 20.2  -*- lexical-binding: t -*-

;; Copyright (C) 1996,1997,1998,1999,2000 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;; Keywords: emulation, compatibility, Mule

;; This file is part of APEL (A Portable Emacs Library).

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

;;    This module requires Emacs 20.1 and 20.2.

;;; Code:

(provide 'mcs-e20)
(require 'mcs-20)

(defsubst encode-mime-charset-region (start end charset &optional lbt)
  "Encode the text between START and END as MIME CHARSET."
  (let (cs)
    (if (and enable-multibyte-characters
	     (setq cs (mime-charset-to-coding-system charset lbt)))
	(encode-coding-region start end cs)
      )))

(defsubst decode-mime-charset-region (start end charset &optional lbt)
  "Decode the text between START and END as MIME CHARSET."
  (let (cs)
    (if (and enable-multibyte-characters
	     (setq cs (mime-charset-to-coding-system charset lbt)))
	(decode-coding-region start end cs)
      )))


(defsubst encode-mime-charset-string (string charset &optional lbt)
  "Encode the STRING as MIME CHARSET."
  (let (cs)
    (if (and enable-multibyte-characters
	     (setq cs (mime-charset-to-coding-system charset lbt)))
	(encode-coding-string string cs)
      string)))

(defsubst decode-mime-charset-string (string charset &optional lbt)
  "Decode the STRING as MIME CHARSET."
  (let (cs)
    (if (and enable-multibyte-characters
	     (setq cs (mime-charset-to-coding-system charset lbt)))
	(decode-coding-string string cs)
      string)))


(defvar charsets-mime-charset-alist
  (delq
   nil
   `(((ascii)						. us-ascii)
     ((ascii latin-iso8859-1)				. iso-8859-1)
     ((ascii latin-iso8859-2)				. iso-8859-2)
     ((ascii latin-iso8859-3)				. iso-8859-3)
     ((ascii latin-iso8859-4)				. iso-8859-4)
     ((ascii latin-iso8859-15)				. iso-8859-15)
     ;;((ascii cyrillic-iso8859-5)			. iso-8859-5)
     ((ascii cyrillic-iso8859-5)			. koi8-r)
     ((ascii arabic-iso8859-6)				. iso-8859-6)
     ((ascii greek-iso8859-7)				. iso-8859-7)
     ((ascii hebrew-iso8859-8)				. iso-8859-8)
     ((ascii latin-iso8859-9)				. iso-8859-9)
     ((ascii latin-iso8859-14)				. iso-8859-14)
     ((ascii latin-jisx0201
	     japanese-jisx0208-1978 japanese-jisx0208)	. iso-2022-jp)
     ((ascii latin-jisx0201
	     katakana-jisx0201 japanese-jisx0208)	. shift_jis)
     ((ascii korean-ksc5601)				. euc-kr)
     ((ascii chinese-gb2312)				. gb2312)
     ((ascii chinese-big5-1 chinese-big5-2)		. big5)
     ((ascii thai-tis620)				. tis-620)
     ;; ((ascii latin-iso8859-1 greek-iso8859-7
     ;; 	     latin-jisx0201 japanese-jisx0208-1978
     ;; 	     chinese-gb2312 japanese-jisx0208
     ;; 	     korean-ksc5601 japanese-jisx0212)		. iso-2022-jp-2)
     ;;((ascii latin-iso8859-1 greek-iso8859-7
     ;;        latin-jisx0201 japanese-jisx0208-1978
     ;;        chinese-gb2312 japanese-jisx0208
     ;;        korean-ksc5601 japanese-jisx0212
     ;;        chinese-cns11643-1 chinese-cns11643-2)	. iso-2022-int-1)
     ;;((ascii latin-iso8859-1 latin-iso8859-2
     ;;        cyrillic-iso8859-5 greek-iso8859-7
     ;;        latin-jisx0201 japanese-jisx0208-1978
     ;;        chinese-gb2312 japanese-jisx0208
     ;;        korean-ksc5601 japanese-jisx0212
     ;;        chinese-cns11643-1 chinese-cns11643-2
     ;;        chinese-cns11643-3 chinese-cns11643-4
     ;;        chinese-cns11643-5 chinese-cns11643-6
     ;;        chinese-cns11643-7)			. iso-2022-int-1)
     )))

(defvar coding-system-to-mime-charset-exclude-regexp
  "^unknown$\\|^x-")

(defun coding-system-to-mime-charset (coding-system)
  "Convert CODING-SYSTEM to a MIME-charset.
Return nil if corresponding MIME-charset is not found."
  (or (coding-system-get coding-system 'mime-charset)
      (let ((coding (coding-system-base coding-system))
	    (alist mime-charset-coding-system-alist)
	    result)
	(while alist
	  (if (eq (coding-system-base (cdar alist)) coding)
	      (setq result (caar alist)
		    alist nil)
	    (setq alist (cdr alist))))
	(unless (and coding-system-to-mime-charset-exclude-regexp
		     (string-match coding-system-to-mime-charset-exclude-regexp
				   (symbol-name result)))
	  result))))

(defun-maybe mime-charset-list ()
  "Return a list of all existing MIME-charset."
  (let ((dest (mapcar (function car) mime-charset-coding-system-alist))
	(rest coding-system-list)
	cs)
    (while rest
      (setq cs (car rest))
      (when (and (setq cs (coding-system-get cs 'mime-charset))
		 (null (memq cs dest)))
	(setq dest (cons cs dest)))
      (setq rest (cdr rest)))
    dest))


;;; @ end
;;;

(require 'product)
(product-provide (provide 'mcs-e20) (require 'apel-ver))

;;; mcs-e20.el ends here
