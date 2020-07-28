;;; mime-image.el --- mime-view filter to display images

;; Copyright (C) 1995,1996,1997,1998 MORIOKA Tomohiko
;; Copyright (C) 1996 Dan Rich

;; Author: MORIOKA Tomohiko <morioka@jaist.ac.jp>
;;	Dan Rich <drich@morpheus.corp.sgi.com>
;;	Daiki Ueno <ueno@ueda.info.waseda.ac.jp>
;;	Katsumi Yamaoka  <yamaoka@jpl.org>
;; Created: 1995/12/15
;;	Renamed: 1997/2/21 from tm-image.el

;; Keywords: image, picture, X-Face, MIME, multimedia, mail, news

;; This file is part of SEMI (Showy Emacs MIME Interfaces).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;	If you use this program with MULE, please install
;;	etl8x16-bitmap.bdf font included in tl package.

;;; Code:

(eval-when-compile (require 'cl))

(eval-when-compile (require 'static))

(require 'mime-view)
(require 'alist)
(require 'path-util)

(defsubst mime-image-normalize-xbm-buffer ()
  (save-excursion
    (let ((case-fold-search t) width height xbytes right margin)
      (goto-char (point-min))
      (or (re-search-forward "_width[\t ]+\\([0-9]+\\)" nil t)
	  (error "!! Illegal xbm file format in the buffer: %s"
		 (current-buffer)))
      (setq width (string-to-number (match-string 1))
	    xbytes (/ (+ width 7) 8))
      (goto-char (point-min))
      (or (re-search-forward "_height[\t ]+\\([0-9]+\\)" nil t)
	  (error "!! Illegal xbm file format in the buffer: %s"
		 (current-buffer)))
      (setq height (string-to-number (match-string 1)))
      (goto-char (point-min))
      (re-search-forward "0x[0-9a-f][0-9a-f],")
      (delete-region (point-min) (match-beginning 0))
      (goto-char (point-min))
      (while (re-search-forward "[\n\r\t ,;}]" nil t)
	(replace-match ""))
      (goto-char (point-min))
      (while (re-search-forward "0x" nil t)
	(replace-match "\\x" nil t))
      (goto-char (point-min))
      (insert "(" (number-to-string width) " "
	      (number-to-string height) " \"")
      (goto-char (point-max))
      (insert "\")")
      (goto-char (point-min))
      (read (current-buffer)))))

(static-cond
 ((featurep 'xemacs)
  (defun mime-image-type-available-p (type)
    (memq type (image-instantiator-format-list)))

  (defun mime-image-create (file-or-data &optional type data-p &rest props)
    (when (and data-p (eq type 'xbm))
      (with-temp-buffer
	(insert file-or-data)
	(setq file-or-data
	      (mime-image-normalize-xbm-buffer))))
    (let ((glyph
	   (make-glyph
	    (if (and type (mime-image-type-available-p type))
		(vconcat
		 (list type (if data-p :data :file) file-or-data)
		 props)
	      file-or-data))))
      (if (nothing-image-instance-p (glyph-image-instance glyph)) nil
	glyph)))

  (defun mime-image-insert (image &optional string area)
    (let ((extent (make-extent (point)
			       (progn (and string
					   (insert string))
				      (point)))))
      (set-extent-property extent 'invisible t)
      (set-extent-end-glyph extent image))))
 ((require 'image nil t)
  (defcustom mime-image-max-height nil
    "*Max displayed image height of attachment image to a message.
It has effect only when imagemagick or image scaling support is
available.
When value is floating-point, it indicates ratio
to `(frame-pixel-width)'.
When `mime-image-normalize-xbm' is non-nil, original size is
always used for xbm image."
    :group 'mime-view
    :type '(choice (const :tag "Use original size" nil)
		   (float :tag "Ratio to frame width")
		   (integer :tag "Specify in pixel")))

  (defcustom mime-image-max-width nil
    "*Max displayed image width of attachment image to a message.
It has effect only when imagemagick or image scaling support is
available.
When value is floating-point number, it indicates ratio
to `(frame-pixel-height)'.
When `mime-image-normalize-xbm' is non-nil, original size is
always used for xbm image."
    :group 'mime-view
    :type '(choice (const :tag "Use original size" nil)
		   (float :tag "Ratio to frame height")
		   (integer :tag "Specify in pixel")))

  (defcustom mime-image-normalize-xbm t
    "*When non-nil, build binary xbm image to display.
Furthermore, image scaling for xbm image is disabled."
    :group 'mime-view
    :type 'boolean)

  (defalias 'mime-image-type-available-p 'image-type-available-p)
  (defun mime-image-create
      (file-or-data &optional type data-p &rest props)
    (let* ((scale-p (and (fboundp 'image-transforms-p)
			 (memq 'scale (image-transforms-p))))
	   (imagemagick
	    (and (null scale-p)
		 (or mime-image-max-height mime-image-max-width)
		 (image-type-available-p 'imagemagick)
		 (fboundp 'imagemagick-filter-types)
		 (member (downcase (symbol-name type))
			 (mapcar (lambda (e) (downcase (symbol-name e)))
				 (imagemagick-filter-types)))))
	   height width)
      (when (and mime-image-normalize-xbm data-p (eq type 'xbm))
	(with-temp-buffer
	  (insert file-or-data)
	  (setq file-or-data
		(mime-image-normalize-xbm-buffer)))
	(setq width (car file-or-data)
	      height (nth 1 file-or-data)
	      file-or-data (nth 2 file-or-data)))
      (setq props
	    (nconc (and width `(:width ,width))
		   (and height `(:height ,height))
		   (and (or scale-p imagemagick)
			mime-image-max-width
			`(:max-width
			  ,(if (integerp mime-image-max-width)
			       mime-image-max-width
			     (floor (* (frame-pixel-width)
				       mime-image-max-width)))))
		   (and (or scale-p imagemagick)
			mime-image-max-height
			`(:max-height
			  ,(if (integerp mime-image-max-height)
			       mime-image-max-height
			     (floor (* (frame-pixel-height)
				       mime-image-max-height)))))
		   props))
      (cond
       (imagemagick
	(apply #'create-image file-or-data 'imagemagick data-p props))
       (t
	(apply #'create-image file-or-data type data-p props)))))
  (defalias 'mime-image-insert 'insert-image))
 (t
  (if (and (featurep 'mule) (require 'bitmap nil t))
      (progn
	(defun mime-image-read-xbm-buffer
	  (condition-case nil
	      (mapconcat #'bitmap-compose
			 (append (bitmap-decode-xbm
				  (bitmap-read-xbm-buffer
				   (current-buffer))) nil) "\n")
	    (error nil)))
	(defun mime-image-insert (image &optional string area)
	  (insert image)))
    (defalias 'mime-image-read-xbm-buffer
      'mime-image-normalize-xbm-buffer)
    (defun mime-image-insert (image &optional string area)
      (save-restriction
	(narrow-to-region (point)(point))
	(let ((face (gensym "mii")))
	  (or (facep face) (make-face face))
	  (set-face-stipple face image)
	  (let ((row (make-string (/ (car image)  (frame-char-width)) ? ))
		(height (/ (nth 1 image)  (frame-char-height)))
		(i 0))
	    (while (< i height)
	      (set-text-properties (point) (progn (insert row)(point))
				   (list 'face face))
	      (insert "\n")
	      (setq i (1+ i))))))))

  (defun mime-image-type-available-p (type)
    (eq type 'xbm))

  (defun mime-image-create (file-or-data &optional type data-p &rest props)
    (when (or (null type) (eq type 'xbm))
      (with-temp-buffer
	(if data-p
	    (insert file-or-data)
	  (insert-file-contents file-or-data))
	(mime-image-read-xbm-buffer))))))

(defvar mime-image-format-alist
  '((image jpeg		jpeg)
    (image gif		gif)
    (image tiff		tiff)
    (image x-tiff	tiff)
    (image xbm		xbm)
    (image x-xbm	xbm)
    (image x-xpixmap	xpm)
    (image png		png)))

(dolist (rule mime-image-format-alist)
  (when (mime-image-type-available-p (nth 2 rule))
    (ctree-set-calist-strictly
     'mime-preview-condition
     (list (cons 'type (car rule))(cons 'subtype (nth 1 rule))
	   '(body . visible)
	   (cons 'body-presentation-method #'mime-display-image)
	   (cons 'image-format (nth 2 rule))))))
    

;;; @ content filter for images
;;;
;;    (for XEmacs 19.12 or later)

(defun mime-display-image (entity situation)
  (message "Decoding image...")
  (condition-case err
      (let ((format (cdr (assq 'image-format situation)))
	    image)
	(setq image
	      (mime-image-create (mime-entity-content entity)
				 format 'data))
	(if (null image)
	    (message "Invalid glyph!")
	  (save-excursion
	    (mime-image-insert image)
	    (insert "\n")
	    (message "Decoding image...done"))))
    (error nil err)))


;;; @ end
;;;

(provide 'mime-image)

;;; mime-image.el ends here
