;;; pces-20.el --- pces submodule for Emacs 20 and XEmacs with coding-system  -*- lexical-binding: t -*-

;; Copyright (C) 1997,1998,1999 Free Software Foundation, Inc.

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

;;    This module requires Emacs 20.0.93, XEmacs 20.3-b5 (with mule)
;;    or later.

;;; Code:

;; (defun-maybe-cond multibyte-string-p (object)
;;   "Return t if OBJECT is a multibyte string."
;;   ((featurep 'mule) (stringp object))
;;   (t                nil))


;;; @ without code-conversion
;;;

(defmacro as-binary-process (&rest body)
  `(let (selective-display	; Disable ^M to nl translation.
	 (coding-system-for-read  'binary)
	 (coding-system-for-write 'binary))
     ,@body))

(defmacro as-binary-input-file (&rest body)
  `(let ((coding-system-for-read 'binary))
     ,@body))

(defmacro as-binary-output-file (&rest body)
  `(let ((coding-system-for-write 'binary))
     ,@body))

(defun write-region-as-binary (start end filename
				     &optional append visit lockname)
  "Like `write-region', q.v., but don't encode."
  (defvar jam-zcat-filename-list)
  (let ((coding-system-for-write 'binary)
	jka-compr-compression-info-list jam-zcat-filename-list)
    (write-region start end filename append visit lockname)))

(defalias 'insert-file-contents-as-binary 'insert-file-contents-literally)

(defun insert-file-contents-as-raw-text (filename
					 &optional visit beg end replace)
  "Like `insert-file-contents', q.v., but don't code and format conversion.
Like `insert-file-contents-literally' and
`insert-file-contents-as-binary', but it allows find-file-hooks,
automatic uncompression, etc and converts line-break code."
  (let ((coding-system-for-read 'raw-text)
	format-alist)
    ;; Returns list of absolute file name and length of data inserted.
    (insert-file-contents filename visit beg end replace)))

(defun insert-file-contents-as-raw-text-CRLF (filename
					      &optional visit beg end replace)
  "Like `insert-file-contents', q.v., but don't code and format conversion.
Like `insert-file-contents-literally' and
`insert-file-contents-as-binary', but it allows find-file-hooks,
automatic uncompression, etc and converts line-break code from
CRLF to LF."
  (let ((coding-system-for-read 'raw-text-dos)
	format-alist)
    ;; Returns list of absolute file name and length of data inserted.
    (insert-file-contents filename visit beg end replace)))

(defun write-region-as-raw-text-CRLF (start end filename
					    &optional append visit lockname)
  "Like `write-region', q.v., but write as network representation."
  (let ((coding-system-for-write 'raw-text-dos))
    (write-region start end filename append visit lockname)))

(defun find-file-noselect-as-binary (filename &optional nowarn rawfile)
  "Like `find-file-noselect', q.v., but don't code and format conversion."
  (let ((coding-system-for-read 'binary)
	format-alist)
    (find-file-noselect filename nowarn rawfile)))

(defun find-file-noselect-as-raw-text (filename &optional nowarn rawfile)
  "Like `find-file-noselect', q.v., but it does not code and format conversion
except for line-break code."
  (let ((coding-system-for-read 'raw-text)
	format-alist)
    (find-file-noselect filename nowarn rawfile)))

(defun find-file-noselect-as-raw-text-CRLF (filename &optional nowarn rawfile)
  "Like `find-file-noselect', q.v., but it does not code and format conversion
except for line-break code."
  (let ((coding-system-for-read 'raw-text-dos)
	format-alist)
    (find-file-noselect filename nowarn rawfile)))

(defun save-buffer-as-binary (&optional args)
  "Like `save-buffer', q.v., but don't encode."
  (let ((coding-system-for-write 'binary))
    (save-buffer args)))

(defun save-buffer-as-raw-text-CRLF (&optional args)
  "Like `save-buffer', q.v., but save as network representation."
  (let ((coding-system-for-write 'raw-text-dos))
    (save-buffer args)))

(defun open-network-stream-as-binary (name buffer host service)
  "Like `open-network-stream', q.v., but don't code conversion."
  (let ((coding-system-for-read 'binary)
	(coding-system-for-write 'binary))
    (open-network-stream name buffer host service)))


;;; @ with code-conversion
;;;

(defun insert-file-contents-as-coding-system
  (coding-system filename &optional visit beg end replace)
  "Like `insert-file-contents', q.v., but CODING-SYSTEM the first arg will
be applied to `coding-system-for-read'."
  (let ((coding-system-for-read coding-system)
	format-alist)
    (insert-file-contents filename visit beg end replace)))

(defun write-region-as-coding-system
  (coding-system start end filename &optional append visit lockname)
  "Like `write-region', q.v., but CODING-SYSTEM the first arg will be
applied to `coding-system-for-write'."
  (defvar jam-zcat-filename-list)
  (let ((coding-system-for-write coding-system)
	jka-compr-compression-info-list jam-zcat-filename-list)
    (write-region start end filename append visit lockname)))

(defun find-file-noselect-as-coding-system
  (coding-system filename &optional nowarn rawfile)
  "Like `find-file-noselect', q.v., but CODING-SYSTEM the first arg will
be applied to `coding-system-for-read'."
  (let ((coding-system-for-read coding-system)
	format-alist)
    (find-file-noselect filename nowarn rawfile)))

(defun save-buffer-as-coding-system (coding-system &optional args)
  "Like `save-buffer', q.v., but CODING-SYSTEM the first arg will be
applied to `coding-system-for-write'."
  (let ((coding-system-for-write coding-system))
    (save-buffer args)))


;;; @ end
;;;

(require 'product)
(product-provide (provide 'pces-20) (require 'apel-ver))

;;; pces-20.el ends here
