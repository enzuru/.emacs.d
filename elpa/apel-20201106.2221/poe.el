;;; poe.el --- Portable Outfit for Emacsen -*- lexical-binding: t -*-

;; Copyright (C) 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2005,
;;   2008 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;;	Shuhei KOBAYASHI <shuhei@aqua.ocn.ne.jp>
;; Keywords: emulation, compatibility, Nemacs, MULE, Emacs/mule, XEmacs

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

;;; Code:

(require 'product)
(product-provide (provide 'poe) (require 'apel-ver))

;; pym.el is a part of poe.el.
(require 'pym)




;;; @ Basic lisp subroutines emulation. (lisp/subr.el)
;;;

;;; @@ Lisp language features.

;; The following two function use `compare-strings', which we don't
;; support yet.
;; (defun assoc-ignore-case (key alist))
;; (defun assoc-ignore-representation (key alist))

;; XEmacs 19.13 and later: (remassoc KEY ALIST)
(defun remassoc (key alist)
  "Delete by side effect any elements of ALIST whose car is `equal' to KEY.
The modified ALIST is returned.  If the first member of ALIST has a car
that is `equal' to KEY, there is no way to remove it by side effect;
therefore, write `(setq foo (remassoc key foo))' to be sure of changing
the value of `foo'."
  (while (and (consp alist)
              (or (not (consp (car alist)))
                  (equal (car (car alist)) key)))
    (setq alist (cdr alist)))
  (if (consp alist)
      (let ((prev alist)
            (tail (cdr alist)))
        (while (consp tail)
          (if (and (consp (car alist))
                   (equal (car (car tail)) key))
              ;; `(setcdr CELL NEWCDR)' returns NEWCDR.
              (setq tail (setcdr prev (cdr tail)))
            (setq prev (cdr prev)
                  tail (cdr tail))))))
  alist)

;; XEmacs 19.13 and later: (remassq KEY ALIST)
(defun remassq (key alist)
  "Delete by side effect any elements of ALIST whose car is `eq' to KEY.
The modified ALIST is returned.  If the first member of ALIST has a car
that is `eq' to KEY, there is no way to remove it by side effect;
therefore, write `(setq foo (remassq key foo))' to be sure of changing
the value of `foo'."
  (while (and (consp alist)
              (or (not (consp (car alist)))
                  (eq (car (car alist)) key)))
    (setq alist (cdr alist)))
  (if (consp alist)
      (let ((prev alist)
            (tail (cdr alist)))
        (while (consp tail)
          (if (and (consp (car tail))
                   (eq (car (car tail)) key))
              ;; `(setcdr CELL NEWCDR)' returns NEWCDR.
              (setq tail (setcdr prev (cdr tail)))
            (setq prev (cdr prev)
                  tail (cdr tail))))))
  alist)

;; XEmacs 19.13 and later: (remrassoc VALUE ALIST)
(defun remrassoc (value alist)
  "Delete by side effect any elements of ALIST whose cdr is `equal' to VALUE.
The modified ALIST is returned.  If the first member of ALIST has a car
that is `equal' to VALUE, there is no way to remove it by side effect;
therefore, write `(setq foo (remrassoc value foo))' to be sure of changing
the value of `foo'."
  (while (and (consp alist)
              (or (not (consp (car alist)))
                  (equal (cdr (car alist)) value)))
    (setq alist (cdr alist)))
  (if (consp alist)
      (let ((prev alist)
            (tail (cdr alist)))
        (while (consp tail)
          (if (and (consp (car tail))
                   (equal (cdr (car tail)) value))
              ;; `(setcdr CELL NEWCDR)' returns NEWCDR.
              (setq tail (setcdr prev (cdr tail)))
            (setq prev (cdr prev)
                  tail (cdr tail))))))
  alist)

;; XEmacs 19.13 and later: (remrassq VALUE ALIST)
(defun remrassq (value alist)
  "Delete by side effect any elements of ALIST whose cdr is `eq' to VALUE.
The modified ALIST is returned.  If the first member of ALIST has a car
that is `eq' to VALUE, there is no way to remove it by side effect;
therefore, write `(setq foo (remrassq value foo))' to be sure of changing
the value of `foo'."
  (while (and (consp alist)
              (or (not (consp (car alist)))
                  (eq (cdr (car alist)) value)))
    (setq alist (cdr alist)))
  (if (consp alist)
      (let ((prev alist)
            (tail (cdr alist)))
        (while (consp tail)
          (if (and (consp (car tail))
                   (eq (cdr (car tail)) value))
              ;; `(setcdr CELL NEWCDR)' returns NEWCDR.
              (setq tail (setcdr prev (cdr tail)))
            (setq prev (cdr prev)
                  tail (cdr tail))))))
  alist)

;;; @@ Input and display facilities.

;; XXX: (defun read-passwd (prompt &optional confirm default))

;;; @@ Miscellanea.

;; Avoid compiler warnings about this variable,
;; which has a special meaning on certain system types.
(defvar buffer-file-type nil
  "Non-nil if the visited file is a binary file.
This variable is meaningful on MS-DOG and Windows NT.
On those systems, it is automatically local in every buffer.
On other systems, this variable is normally always nil.")



;;; @ Frame commands emulation. (lisp/frame.el)
;;;

;; XEmacs 21.0 and later:
;;  (save-selected-frame &rest BODY)
(defmacro save-selected-frame (&rest body)
  "Execute forms in BODY, then restore the selected frame."
  (list 'let
	'((save-selected-frame-frame (selected-frame)))
	(list 'unwind-protect
	      (cons 'progn body)
	      (list 'select-frame 'save-selected-frame-frame))))


;;; @ Basic editing commands emulation. (lisp/simple.el)
;;;


;;; @ XEmacs emulation.
;;;

(defun find-face (face-or-name)
  "Retrieve the face of the given name.
If FACE-OR-NAME is a face object, it is simply returned.
Otherwise, FACE-OR-NAME should be a symbol.  If there is no such face,
nil is returned.  Otherwise the associated face object is returned."
  (car (memq face-or-name (face-list))))

;; XEmacs 21: (character-to-event CH &optional EVENT DEVICE)
(defun character-to-event (ch)
  "Convert keystroke CH into an event structure, replete with bucky bits.
Note that CH (the keystroke specifier) can be an integer, a character
or a symbol such as 'clear."
  ch)

;; XEmacs 21: (event-to-character EVENT
;;             &optional ALLOW-EXTRA-MODIFIERS ALLOW-META ALLOW-NON-ASCII)
(defun event-to-character (event)
  "Return the character approximation to the given event object.
If the event isn't a keypress, this returns nil."
  (cond
   ((symbolp event)
    ;; mask is (BASE-TYPE MODIFIER-BITS) or nil.
    (let ((mask (get event 'event-symbol-element-mask)))
      (if mask
	  (let ((base (get (car mask) 'ascii-character)))
	    (if base
		(logior base (car (cdr mask))))))))
   ((integerp event) event)))

;; v18: no event; (read-char)
;; Emacs 19, 20.1 and 20.2: (read-event)
;; Emacs 20.3: (read-event &optional PROMPT SUPPRESS-INPUT-METHOD)
;; Emacs 20.4: (read-event &optional PROMPT INHERIT-INPUT-METHOD)
;; XEmacs: (next-event &optional EVENT PROMPT),
;;         (next-command-event &optional EVENT PROMPT)
(defun next-command-event (&optional _event prompt)
  "Read an event object from the input stream.
If EVENT is non-nil, it should be an event object and will be filled
in and returned; otherwise a new event object will be created and
returned.
If PROMPT is non-nil, it should be a string and will be displayed in
the echo area while this function is waiting for an event."
  ;; Emacs 20.4 and later.
  (read-event prompt))			; should specify 2nd arg?


;;; @ MULE 2 emulation.
;;;

(defun cancel-undo-boundary ()
  "Cancel undo boundary."
  (if (and (consp buffer-undo-list)
	   (null (car buffer-undo-list)))
      (setq buffer-undo-list (cdr buffer-undo-list))))


;;; @ End.
;;;

;;; poe.el ends here
