;;; mime-pgp.el --- mime-view internal methods for EasyPG.

;; Copyright (C) 1995,1996,1997,1998,1999,2000 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;;	Daiki Ueno <ueno@unixuser.org>
;;	Kazuhiro Ito <kzhr@d1.dion.ne.jp>
;; Created: 1995/12/7
;;	Renamed: 1997/2/27 from tm-pgp.el
;;	Renamed: 2010/11/27 from mime-pgp.el in emiko-epg
;;	Renamed: 2012/10/05 from mime-epg.el
;; Keywords: PGP, security, MIME, multimedia, mail, news

;; This file is part of SEMI (Secure Emacs MIME Interface).

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

(require 'mime-parse)
(require 'mime-play)
(require 'epg)
(require 'epa)

(eval-when-compile (require 'mmgeneric))

;;; @ Internal functions

(defun mime-pgp-maybe-remove-cr (string)
  ;; Remove CRs if header contains CR.
  (if (string-match "\\`.*\r\n" string)
      (let (inhibit-eol-conversion)
	(decode-coding-string string 'raw-text-dos))
    string))

(defun mime-pgp-decrypt-string (context cipher)
  (mime-pgp-maybe-remove-cr (epg-decrypt-string context cipher)))

(defun mime-pgp-verify-string (context cipher)
  (mime-pgp-maybe-remove-cr (epg-verify-string context cipher)))

(defun mime-pgp-verify-result-to-string (context)
  (let ((result (epg-context-result-for context 'verify)))
    (unless (stringp result)
      (setq result (epg-verify-result-to-string result)))
    (when (> (length result) 0)
      (unless (string-equal (substring result -1) "\n")
	(setq result (concat result "\n"))))
    result))

(defun mime-pgp-pkcs7-decrypt-enveloped-data (context content)
  (let (result failure)
    (condition-case error
	(setq result (decode-coding-string
		      (mime-pgp-decrypt-string context content)
		      'raw-text))
      (error (setq result error)))
    result))

(defun mime-pgp-pkcs7-verify-signed-data (context content)
  (let (result)
    (if (condition-case error
	    (setq result (decode-coding-string
			  (mime-pgp-verify-string context content)
			  'raw-text))
	  (error (setq result error) nil))
	(let ((boundary (concat "PKCS7--" (mime-edit-make-boundary))))
	  (concat "Content-Type: multipart/mixed;\n"
		  " boundary=\"" boundary "\"\n"
		  "Content-Transfer-Encoding: 7bit\n\n"
		  "--" boundary "\n"
		  result
		  "--" boundary "\n"
		  "Content-Type: text/plain; charset=UTF-8\n"
		  "Content-Transfer-Encoding: 8bit\n\n"
		  (encode-coding-string
		   (mime-pgp-verify-result-to-string context) 'utf-8)
		  "--" boundary "--\n"))
      result)))

(defun mime-pgp-smime-type-from-situation (situation)
  (let ((type (cdr (assoc "smime-type" situation))))
    (if type
	(intern (downcase type))
      'enveloped-data)))

(defun mime-pgp-entity-string (entity)
  (with-temp-buffer
    (buffer-disable-undo)
    (set-buffer-multibyte nil)
    (mime-insert-entity entity)
    (buffer-string)))

;;; @ Internal method for multipart/signed

(defun mime-verify-multipart/signed (entity situation)
  "Internal method to verify multipart/signed."
  (mime-play-entity
   (nth 1 (mime-entity-children entity)) ; entity-info of signature
   (list (assq 'mode situation)) ; play-mode
   ))

;;; @ Internal method for multipart/encrypted

(defun mime-display-multipart/pgp-encrypted (entity situation)
  (let ((original-major-mode-cell (assq 'major-mode situation))
	(default-situation
	  (cdr (assq 'childrens-situation situation)))
	child-situation)
    (unless mime-pgp-decrypt-when-preview
      (insert "This part is encrypted.\n"))
    (when original-major-mode-cell
      (setq default-situation
	    (cons original-major-mode-cell default-situation)))
    (mapc
     (lambda (child)
       (setq child-situation
	     (mime-find-entity-preview-situation child default-situation))
       (if (and (eq (cdr (assq 'type child-situation)) 'application)
		(eq (cdr (assq 'subtype child-situation)) 'pgp-encrypted))
	   (mime-display-entity
	    child (put-alist 'body mime-pgp-decrypt-when-preview
			     (copy-alist child-situation)))
	 (when mime-view-multipart/related-show-all-children
	   (mime-display-entity
	    child (put-alist 'body 'invisible (copy-alist child-situation))))))
     (mime-entity-children entity))))

;;; @ Internal method for application/*-signature

(defun mime-verify-application/*-signature-internal (entity situation)
  (let* ((mother (mime-entity-parent entity))
	 (orig-entity (car (mime-entity-children mother)))
	 (protocol (cdr (assoc "protocol" (mime-entity-parameters mother))))
	 context)
    (if (null protocol)
	"No protocol is specified."
      (setq context
	    (epg-make-context
	     (cond 
	      ((equal protocol "application/pgp-signature")
	       'OpenPGP)
	      ((string-match
		"\\`application/\\(x-\\)?pkcs7-signature\\'" protocol)
	       'CMS))))
      (if (null context)
	  (format "Unknown protocol: %s." protocol)
	(epg-verify-string context
			   (mime-entity-content entity)
			   (let (inhibit-eol-conversion)
			     (encode-coding-string (mime-pgp-entity-string orig-entity)
						   'raw-text-dos)))
	(epg-context-result-for context 'verify)))))

(defun mime-verify-application/*-signature (entity situation)
  (let ((verify-result
	 (mime-verify-application/*-signature-internal entity situation))
	window)
    (cond
     ((stringp verify-result)
      (mime-show-echo-buffer verify-result))
     ((> (length verify-result) 1)
      (mime-show-echo-buffer (epg-verify-result-to-string verify-result)))
     (verify-result
      (epa-display-info (epg-verify-result-to-string verify-result))
	(when (and epa-popup-info-window
		   (setq window (get-buffer-window epa-info-buffer)))
	  (select-window window))))))

(defun mime-preview-application/*-signature (entity situation)
  (let ((verify-result
	 (condition-case error
	     (mime-verify-application/*-signature-internal entity situation)
	   (error (format "Verification failed, %s" error))))
	string)
    (if (stringp verify-result)
	(insert verify-result)
      (setq string (epg-verify-result-to-string verify-result))
      (when (> (length string) 0)
	(unless (string-equal (substring string -1) "\n")
	  (setq string (concat string "\n")))
	(insert string)))))

;;; @ Internal method for application/pgp-encrypted

(defun mime-decrypt-application/pgp-encrypted (entity situation)
  (let* ((mother (mime-entity-parent entity))
	 (encrypted-entity (nth 1 (mime-entity-children mother)))
	 (p-win (or (get-buffer-window (current-buffer))
		    (get-largest-window)))
	 (new-name
	  (format "%s-%s" (buffer-name) (mime-entity-number entity)))
	 (mother (current-buffer))
	 (preview-buffer (concat "*Preview-" (buffer-name) "*"))
	 representation-type message-buf context plain verify-result)
    (set-buffer (setq message-buf (get-buffer-create new-name)))
    (erase-buffer)
    (mime-insert-entity encrypted-entity)
    (goto-char (point-min))
    (setq context (epg-make-context)
	  plain (decode-coding-string
		 (mime-pgp-decrypt-string
		  context
		  (buffer-substring (point-min)(point-max)))
		 'raw-text))
    (delete-region (point-min)(point-max))
    (insert plain)
    (setq representation-type 'binary
	  major-mode 'mime-show-message-mode)
    (save-window-excursion
      (mime-view-buffer nil preview-buffer mother
			nil representation-type)
      (make-local-variable 'mime-view-temp-message-buffer)
      (setq mime-view-temp-message-buffer message-buf))
    (set-window-buffer p-win preview-buffer)))

(defvar mime-pgp-decrypted-buffers nil)

(defun mime-pgp-kill-decrypted-buffers ()
  (mapc (lambda (buffer)
	  (when (bufferp buffer)
	    (kill-buffer buffer)))
	mime-pgp-decrypted-buffers))

(defun mime-pgp-register-decrypted-buffer (buffer)
  (add-hook 'kill-buffer-hook 'mime-pgp-kill-decrypted-buffers nil t)
  (make-local-variable 'mime-pgp-decrypted-buffers)
  (add-to-list 'mime-pgp-decrypted-buffers buffer))

;; Imported and modified from Wanderlust.
(defun mime-preview-application/pgp-encrypted (entity situation)
  (let (p buffer decrypted-entity failed result)
    (goto-char (setq p (point-max)))
    (save-restriction
      (narrow-to-region p p)
      (setq buffer (generate-new-buffer (concat mime-temp-buffer-name "PGP*")))
      (if (null (stringp
		 (setq result (mime-pgp-pkcs7-decrypt-enveloped-data
			       (epg-make-context)
			       (mime-pgp-entity-string
				(nth 1 (mime-entity-children
					(mime-entity-parent entity))))))))
	  (insert (format "%s" (cdr failed)))
	(with-current-buffer buffer
	  (insert result)
	  (setq decrypted-entity
		(mime-parse-message
		 (mm-expand-class-name 'buffer)
		 nil entity (mime-entity-node-id entity))
		buffer-read-only t))
	(mime-pgp-register-decrypted-buffer buffer)
	(mime-display-entity
	 decrypted-entity nil '((header . visible)
				(body . visible)
				(entity-button . invisible)))))))


;;; @ Internal method for application/pgp-keys

(defun mime-add-application/pgp-keys (entity situation)
  (when (y-or-n-p "Do you want to import PGP keys? ")
    (let ((context (epg-make-context))
	  result window)
      (epg-import-keys-from-string context (mime-entity-content entity))
      (when (setq result (epg-context-result-for context 'import))
	(epa-display-info (epg-import-result-to-string result))
	(when (and epa-popup-info-window
		   (setq window (get-buffer-window epa-info-buffer)))
	  (select-window window))))))


;;; @ Internal method for application/pkcs7-mime

(defun mime-view-application/pkcs7-mime (entity situation)
  (let ((smime-type (mime-pgp-smime-type-from-situation situation))
	(p-win (or (get-buffer-window (current-buffer))
		   (get-largest-window)))
	(new-name
	 (format "%s-%s" (buffer-name) (mime-entity-number entity)))
	(mother (current-buffer))
	(preview-buffer (concat "*Preview-" (buffer-name) "*"))
	(context (epg-make-context 'CMS))
	message-buf result fn)
    (setq fn
	  (cdr
	   (assq smime-type
		 '((signed-data . mime-pgp-pkcs7-verify-signed-data)
		   (enveloped-data . mime-pgp-pkcs7-decrypt-enveloped-data)))))
    (unless fn
      (error "Unsupported smime-type (%s)" smime-type))
    (if (null (stringp (setq result (funcall fn context
					     (mime-entity-content entity)))))
	(signal (car result) (cdr result))
      (set-buffer (setq message-buf (get-buffer-create new-name)))
      (let ((inhibit-read-only t)
	    buffer-read-only)
	(set-buffer-multibyte nil)
	(erase-buffer)
	(insert result)
	(setq major-mode 'mime-show-message-mode)
	(save-window-excursion
	  (mime-view-buffer nil preview-buffer mother nil 'binary)
	  (make-local-variable 'mime-view-temp-message-buffer)
	  (setq mime-view-temp-message-buffer message-buf))
	(set-window-buffer p-win preview-buffer)))))

(defun mime-preview-application/pkcs7-mime (entity situation)
  (let ((smime-type (mime-pgp-smime-type-from-situation situation))
	(context (epg-make-context 'CMS))
	p buffer decrypted-entity result fn)
    (setq fn
	  (cdr
	   (assq smime-type
		 '((signed-data . mime-pgp-pkcs7-verify-signed-data)
		   (enveloped-data . mime-pgp-pkcs7-decrypt-enveloped-data)))))
    (if (null fn)
	(insert "Unsupported smime-type (" smime-type ")\n")
      (goto-char (setq p (point-max)))
      (save-restriction
	(narrow-to-region p p)
	(if (null (stringp (setq result
				 (funcall fn context
					  (mime-entity-content entity)))))
	    (insert (format "%s" (cdr result)))
	  (setq buffer (generate-new-buffer
			(concat mime-temp-buffer-name "PKCS7*")))
	  (with-current-buffer buffer
	    (set-buffer-multibyte nil)
	    (insert result)
	    (setq decrypted-entity
		  (mime-parse-message
		   (mm-expand-class-name 'buffer)
		   nil entity (mime-entity-node-id-internal entity))
		  buffer-read-only t))
	  (mime-pgp-register-decrypted-buffer buffer)
	  (mime-display-entity
	   decrypted-entity nil '((header . invisible)
				  (body . visible)
				  (entity-button . invisible))))))))

;;; @ end
;;;

(provide 'mime-pgp)

(run-hooks 'mime-pgp-load-hook)

;;; mime-pgp.el ends here
