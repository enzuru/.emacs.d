;;; emu.el --- Emulation module for each Emacs variants  -*- lexical-binding: t -*-

;; Copyright (C) 1995,1996,1997,1998 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <morioka@jaist.ac.jp>
;; Keywords: emulation, compatibility, Nemacs, MULE, Emacs/mule, XEmacs

;; This file is part of emu.

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

(require 'poe)

(defvar running-emacs-18 nil)
(defvar running-xemacs nil)

(defvar running-mule-merged-emacs t)
(defvar running-xemacs-with-mule nil)

(defvar running-emacs-19 nil)
(defvar running-emacs-19_29-or-later t)

(defvar running-xemacs-19 nil)
(defvar running-xemacs-20-or-later running-xemacs)
(defvar running-xemacs-19_14-or-later running-xemacs-20-or-later)

;; mouse
(defvar mouse-button-1 [mouse-1])
(defvar mouse-button-2 [mouse-2])
(defvar mouse-button-3 [down-mouse-3])

(require 'poem)
(require 'mcharset)
(require 'invisible)

(defsubst char-list-to-string (char-list)
  "Convert list of character CHAR-LIST to string."
  (apply (function string) char-list))

(defalias 'insert-binary-file-contents-literally
  'insert-file-contents-literally)

;; old Mule emulating aliases
(defun char-category (character)
  "Return string of category mnemonics for CHAR in TABLE.
CHAR can be any multilingual character
TABLE defaults to the current buffer's category table."
  (category-set-mnemonics (char-category-set character)))


;;; @ Mule emulating aliases
;;;
;;; You should not use it.

(or (boundp '*noconv*)
    (defconst *noconv* 'binary
      "Coding-system for binary.
This constant is defined to emulate old MULE anything older than MULE 2.3.
It is obsolete, so don't use it."))


;;; @ without code-conversion
;;;

(defalias 'insert-binary-file-contents 'insert-file-contents-as-binary)
(make-obsolete 'insert-binary-file-contents 'insert-file-contents-as-binary
	       "17 Sep 1998")

(defun-maybe insert-binary-file-contents-literally (filename
						    &optional visit
						    beg end replace)
  "Like `insert-file-contents-literally', q.v., but don't code conversion.
A buffer may be modified in several ways after reading into the buffer due
to advanced Emacs features, such as file-name-handlers, format decoding,
find-file-hooks, etc.
  This function ensures that none of these modifications will take place."
  (as-binary-input-file
   ;; Returns list absolute file name and length of data inserted.
   (insert-file-contents-literally filename visit beg end replace)))


;;; @ end
;;;

(require 'product)
(product-provide (provide 'emu) (require 'apel-ver))

;;; emu.el ends here
