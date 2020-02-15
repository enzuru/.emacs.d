;;; mime-view.el --- interactive MIME viewer for GNU Emacs

;; Copyright (C) 1995,96,97,98,99,2000 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;; Created: 1994/07/13
;;	Renamed: 1994/08/31 from tm-body.el
;;	Renamed: 1997/02/19 from tm-view.el
;; Keywords: MIME, multimedia, mail, news

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

;;; Code:

(require 'mime)
(require 'semi-def)
(require 'calist)
(require 'alist)
(require 'mime-conf)
(require 'path-util)

(eval-when-compile (require 'static))


;;; @ version
;;;

(defconst mime-view-version
  (concat (mime-product-name mime-user-interface-product) " MIME-View "
	  (mapconcat #'number-to-string
		     (mime-product-version mime-user-interface-product) ".")
	  " (" (mime-product-code-name mime-user-interface-product) ")"))


;;; @ variables
;;;

(defgroup mime-view nil
  "MIME view mode"
  :group 'mime)

(defcustom mime-situation-examples-file "~/.mime-example"
  "*File name of situation-examples demonstrated by user."
  :group 'mime-view
  :type 'file)

(defcustom mime-preview-move-scroll nil
  "*Decides whether to scroll when moving to next entity.
When t, scroll the buffer. Non-nil but not t means scroll when
the next entity is within next-screen-context-lines from top or
buttom. Nil means don't scroll at all."
  :group 'mime-view
  :type '(choice (const :tag "Off" nil)
		 (const :tag "On" t)
		 (sexp :tag "Situation" 1)))

(defcustom mime-view-mailcap-files
  '("~/.mailcap" "/usr/etc/mailcap" "/etc/mailcap")
  "List of mailcap files."
  :group 'mime-view
  :type '(repeat file))

(defcustom mime-view-buttons-visible t
  "Toggle visibility of MIME buttons."
  :group 'mime-view
  :type 'boolean)

(defcustom mime-view-multipart/related-show-all-children t
  "When non-nil, do not hide child entities."
  :group 'mime-view
  :type 'boolean)

(defcustom mime-view-multipart/alternative-show-all-children t
  "When non-nil, show hidden descendant entities's buttons in
multipart/alternative entities."
  :group 'mime-view
  :type 'boolean)

(defvar mime-display-multipart/multilingual-unknown-translation-type
  "(unknown)")

(defcustom mime-display-multipart/multilingual-prefered-languages
  (mapcar (lambda (lang)
	    (format "^%s\\(-.+\\)?" (regexp-quote (symbol-name lang))))
	  (let ((result (if (fboundp 'get-language-info)
			    (get-language-info
			     current-language-environment 'iso639-language)
			  'en)))
	    (if (eq result 'en)
		(list result)
	      (cons result '(en)))))
  "Specify language automatically choiced for
multipart/multilingual entities. See docstring of
`mime-display-multipart/multilingual' for details."
  :group 'mime-view
  :type '(repeat regexp))

(defcustom mime-display-multipart/multilingual-translation-type-score
  `(("original" . 2)
    ("human" . 1)
    ("automated" . -1)
    (,mime-display-multipart/multilingual-unknown-translation-type . 0)
    )
  "Specify scores Content-Translation-Type: header fields.  When
score is negative value, corresponding entity is not displayed
automatically.  If field calue is missing or field does not
exist, field value is treated as \"(unknown)\".  See docstring of
`mime-display-multipart/multilingual' for details."
  :group 'mime-view
  :type '(repeat (cons string integer)))

(defcustom mime-display-multipart/multilingual-interactive nil
  "When non-nil, you are asked which language entity should be
displayed for multipart/multilingual entity."
  :group 'mime-view
  :type 'boolean)

(defcustom mime-view-text/html-score 3
  "Score for text/html entity when previewer is available."
  :group 'mime-view
  :type 'integer)

(defcustom mime-view-text/html-previewer-alist
  (delq nil `((w3m mime-w3m-preview-text/html mime-w3m)
	      ,(and (fboundp 'libxml-parse-html-region)
		    '(shr mime-shr-preview-text/html mime-shr))
	      (w3 mime-preview-text/html mime-w3)))
  "Alist for text/html entity previewer.
Each element is a list consists of required module, previewer function and required feature for previewer function."
  :group 'mime-view
  :type '(repeat (list (symbol :tag "Module")
		       (symbol :tag "Function")
		       (symbol :tag "Feature"))))

(defcustom mime-view-text/html-previewer
  (let ((alist mime-view-text/html-previewer-alist))
    (while (and alist (null (module-installed-p (caar alist))))
      (setq alist (cdr alist)))
    (caar alist))
  "Indicate text/html entity previewer.  Possible vaules are each car of `mime-view-text/html-previewer-alist' element or nil.  When this value is nil or preview is not available, text/html entity is displayed as if text/plain part."
  :group 'mime-view
  :type `(choice ,@(mapcar (lambda (elt) (list 'const (car elt)))
			   mime-view-text/html-previewer-alist)
		 (const :tag "Disable previewer" nil)))

(defcustom mime-display-text/plain-flowed-fill-column nil
  "Fill column for formatting flowed text."
  :group 'mime-view
  :type '(choice (integer :tag "Fixed value")
		 (number :tag "ratio to window's width")
		 (sexp :tag "S-expression")
		 (const nil :tag "Use fill-column's value")))

(defcustom mime-pgp-verify-when-preview t
  "When non-nil, verify signed part while viewing."
  :group 'mime-view
  :type 'boolean)

(defcustom mime-pgp-decrypt-when-preview nil
  "When non-nil, decrypt encrypted part while viewing."
  :group 'mime-view
  :type 'boolean)

;;; @ in raw-buffer (representation space)
;;;

(defvar mime-preview-buffer nil
  "MIME-preview buffer corresponding with the (raw) buffer.")
(make-variable-buffer-local 'mime-preview-buffer)


(defvar mime-raw-representation-type-alist
  '((mime-show-message-mode     . binary)
    (mime-temp-message-mode     . binary)
    (t                          . cooked)
    )
  "Alist of major-mode vs. representation-type of mime-raw-buffer.
Each element looks like (SYMBOL . REPRESENTATION-TYPE).  SYMBOL is
major-mode or t.  t means default.  REPRESENTATION-TYPE must be
`binary' or `cooked'.")


;;; @ in preview-buffer (presentation space)
;;;

(defvar mime-mother-buffer nil
  "Mother buffer corresponding with the (MIME-preview) buffer.
If current MIME-preview buffer is generated by other buffer, such as
message/partial, it is called `mother-buffer'.")
(make-variable-buffer-local 'mime-mother-buffer)

;; (defvar mime-raw-buffer nil
;;   "Raw buffer corresponding with the (MIME-preview) buffer.")
;; (make-variable-buffer-local 'mime-raw-buffer)

(defvar mime-preview-original-window-configuration nil
  "Window-configuration before mime-view-mode is called.")
(make-variable-buffer-local 'mime-preview-original-window-configuration)

(defun mime-preview-original-major-mode (&optional recursive point)
  "Return major-mode of original buffer.
If optional argument RECURSIVE is non-nil and current buffer has
mime-mother-buffer, it returns original major-mode of the
mother-buffer."
  (if (and recursive mime-mother-buffer)
      (with-current-buffer mime-mother-buffer
	(mime-preview-original-major-mode recursive)
	)
    (cdr (assq 'major-mode
	       (get-text-property (or point
				      (if (> (point) (buffer-size))
					  (max (1- (point-max)) (point-min))
					(point)))
				  'mime-view-situation)))))


;;; @ entity information
;;;

(defun mime-entity-situation (entity &optional situation)
  "Return situation of ENTITY."
  (let (rest param name)
    ;; Content-Type
    (unless (assq 'type situation)
      (setq rest (or (mime-entity-content-type entity)
		     (make-mime-content-type 'text 'plain))
	    situation (cons (car rest) situation)
	    rest (cdr rest))
      )
    (unless (assq 'subtype situation)
      (or rest
	  (setq rest (or (cdr (mime-entity-content-type entity))
			 '((subtype . plain)))))
      (setq situation (cons (car rest) situation)
	    rest (cdr rest))
      )
    (while rest
      (setq param (car rest))
      (or (assoc (car param) situation)
	  (setq situation (cons param situation)))
      (setq rest (cdr rest)))
    
    ;; Content-Disposition
    (setq rest nil)
    (unless (assq 'disposition-type situation)
      (setq rest (mime-entity-content-disposition entity))
      (if rest
	  (setq situation (cons (cons 'disposition-type
				      (mime-content-disposition-type rest))
				situation)
		rest (mime-content-disposition-parameters rest))
	))
    (while rest
      (setq param (car rest)
	    name (car param))
      (if (cond ((string= name "filename")
		 (if (assq 'filename situation)
		     nil
		   (setq name 'filename)))
		((string= name "creation-date")
		 (if (assq 'creation-date situation)
		     nil
		   (setq name 'creation-date)))
		((string= name "modification-date")
		 (if (assq 'modification-date situation)
		     nil
		   (setq name 'modification-date)))
		((string= name "read-date")
		 (if (assq 'read-date situation)
		     nil
		   (setq name 'read-date)))
		((string= name "size")
		 (if (assq 'size situation)
		     nil
		   (setq name 'size)))
		(t (setq name (cons 'disposition name))
		   (if (assoc name situation)
		       nil
		     name)))
	  (setq situation
		(cons (cons name (cdr param))
		      situation)))
      (setq rest (cdr rest)))
    
    ;; Content-Transfer-Encoding
    (or (assq 'encoding situation)
	(setq situation
	      (cons (cons 'encoding (or (mime-entity-encoding entity)
					"7bit"))
		    situation)))
    
    situation))

(defsubst mime-delq-null-situation (situations field
					       &rest ignored-values)
  (let (dest)
    (while situations
      (let* ((situation (car situations))
	     (cell (assq field situation)))
	(if cell
	    (or (memq (cdr cell) ignored-values)
		(setq dest (cons situation dest))
		)))
      (setq situations (cdr situations)))
    dest))

(defun mime-compare-situation-with-example (situation example)
  (let ((example (copy-alist example))
	(match 0))
    (while situation
      (let* ((cell (car situation))
	     (key (car cell))
	     (ecell (assoc key example)))
	(when ecell
	  (if (equal cell ecell)
	      (setq match (1+ match))
	    (setq example (delq ecell example))
	    ))
	)
      (setq situation (cdr situation))
      )
    (cons match example)
    ))

(defun mime-sort-situation (situation)
  (sort situation
	#'(lambda (a b)
	    (let ((a-t (car a))
		  (b-t (car b))
		  (order '((type . 1)
			   (subtype . 2)
			   (mode . 3)
			   (method . 4)
			   (major-mode . 5)
			   (disposition-type . 6)
			   ))
		  a-order b-order)
	      (if (symbolp a-t)
		  (let ((ret (assq a-t order)))
		    (if ret
			(setq a-order (cdr ret))
		      (setq a-order 7)
		      ))
		(setq a-order 8)
		)
	      (if (symbolp b-t)
		  (let ((ret (assq b-t order)))
		    (if ret
			(setq b-order (cdr ret))
		      (setq b-order 7)
		      ))
		(setq b-order 8)
		)
	      (if (= a-order b-order)
		  (string< (format "%s" a-t)(format "%s" b-t))
		(< a-order b-order))
	      )))
  )

(defun mime-unify-situations (entity-situation
			      condition situation-examples
			      &optional required-name ignored-value
			      every-situations)
  (let (ret)
    (in-calist-package 'mime-view)
    (setq ret
	  (ctree-find-calist condition entity-situation
			     every-situations))
    (if required-name
	(setq ret (mime-delq-null-situation ret required-name
					    ignored-value t)))
    (or (assq 'ignore-examples entity-situation)
	(if (cdr ret)
	    (let ((rest ret)
		  (max-score 0)
		  (max-escore 0)
		  max-examples
		  max-situations)
	      (while rest
		(let ((situation (car rest))
		      (examples situation-examples))
		  (while examples
		    (let* ((ret
			    (mime-compare-situation-with-example
			     situation (caar examples)))
			   (ret-score (car ret)))
		      (cond ((> ret-score max-score)
			     (setq max-score ret-score
				   max-escore (cdar examples)
				   max-examples (list (cdr ret))
				   max-situations (list situation))
			     )
			    ((= ret-score max-score)
			     (cond ((> (cdar examples) max-escore)
				    (setq max-escore (cdar examples)
					  max-examples (list (cdr ret))
					  max-situations (list situation))
				    )
				   ((= (cdar examples) max-escore)
				    (setq max-examples
					  (cons (cdr ret) max-examples))
				    (or (member situation max-situations)
					(setq max-situations
					      (cons situation max-situations)))
				    )))))
		    (setq examples (cdr examples))))
		(setq rest (cdr rest)))
	      (when max-situations
		(setq ret max-situations)
		(while max-examples
		  (let* ((example (car max-examples))
			 (cell
			  (assoc example situation-examples)))
		    (if cell
			(setcdr cell (1+ (cdr cell)))
		      (setq situation-examples
			    (cons (cons example 0)
				  situation-examples))
		      ))
		  (setq max-examples (cdr max-examples))
		  )))))
    (cons ret situation-examples)
    ;; ret: list of situations
    ;; situation-examples: new examples (notoce that contents of
    ;;                     argument `situation-examples' has bees modified)
    ))

(defun mime-view-entity-title (entity)
  (or (mime-entity-read-field entity 'Content-Description)
      (mime-entity-filename entity)
      (mime-entity-read-field entity 'Subject)
      ""))

(defvar mime-preview-situation-example-list nil)
(defvar mime-preview-situation-example-list-max-size 16)
;; (defvar mime-preview-situation-example-condition nil)

(defun mime-find-entity-preview-situation (entity
					   &optional default-situation)
  (or (let ((ret
	     (mime-unify-situations
	      (append (mime-entity-situation entity)
		      default-situation)
	      mime-preview-condition
	      mime-preview-situation-example-list)))
	(setq mime-preview-situation-example-list
	      (cdr ret))
	(caar ret))
      default-situation))

  
(defvar mime-acting-situation-example-list nil)
(defvar mime-acting-situation-example-list-max-size 16)
(defvar mime-situation-examples-file-coding-system nil)

(defun mime-view-read-situation-examples-file (&optional file)
  (or file
      (setq file mime-situation-examples-file))
  (if (and file
	   (file-readable-p file))
      (with-temp-buffer
	(insert-file-contents file)
	(setq mime-situation-examples-file-coding-system
              (static-cond
	       ((boundp 'buffer-file-coding-system)
		(symbol-value 'buffer-file-coding-system))
	       ((boundp 'file-coding-system)
		(symbol-value 'file-coding-system))
	       (t nil))
	      ;; (and (boundp 'buffer-file-coding-system)
              ;;      buffer-file-coding-system)
	      )
	(condition-case error
	    (eval-buffer)
	  (error (message "%s is broken: %s" file (cdr error))))
	;; format check
	(condition-case nil
	    (let ((i 0))
	      (while (and (> (length mime-preview-situation-example-list)
			     mime-preview-situation-example-list-max-size)
			  (< i 16))
		(setq mime-preview-situation-example-list
		      (mime-reduce-situation-examples
		       mime-preview-situation-example-list))
		(setq i (1+ i))))
	  (error (setq mime-preview-situation-example-list nil)))
	;; (let ((rest mime-preview-situation-example-list))
	;;   (while rest
	;;     (ctree-set-calist-strictly 'mime-preview-condition
	;;                                (caar rest))
	;;     (setq rest (cdr rest))))
	(condition-case nil
	    (let ((i 0))
	      (while (and (> (length mime-acting-situation-example-list)
			     mime-acting-situation-example-list-max-size)
			  (< i 16))
		(setq mime-acting-situation-example-list
		      (mime-reduce-situation-examples
		       mime-acting-situation-example-list))
		(setq i (1+ i))))
	  (error (setq mime-acting-situation-example-list nil))))))

(defun mime-save-situation-examples ()
  (if (or mime-preview-situation-example-list
	  mime-acting-situation-example-list)
      (let ((file mime-situation-examples-file)
	    print-length print-level)
        (when file
          (with-temp-buffer
            (insert ";;; " (file-name-nondirectory file) "\n")
            (insert "\n;; This file is generated automatically by "
                    mime-view-version "\n\n")
            (insert ";;; Code:\n\n")
            (if mime-preview-situation-example-list
                (pp `(setq mime-preview-situation-example-list
                           ',mime-preview-situation-example-list)
                    (current-buffer)))
            (if mime-acting-situation-example-list
                (pp `(setq mime-acting-situation-example-list
                           ',mime-acting-situation-example-list)
                    (current-buffer)))
            (insert "\n;;; "
                    (file-name-nondirectory file)
                    " ends here.\n")
            (static-cond
             ((boundp 'buffer-file-coding-system)
              (setq buffer-file-coding-system
                    mime-situation-examples-file-coding-system))
             ((boundp 'file-coding-system)
              (setq file-coding-system
                    mime-situation-examples-file-coding-system)))
            ;; (setq buffer-file-coding-system
            ;;       mime-situation-examples-file-coding-system)
            (setq buffer-file-name file)
            (save-buffer))))))

(add-hook 'kill-emacs-hook 'mime-save-situation-examples)

(defun mime-reduce-situation-examples (situation-examples)
  (let ((len (length situation-examples))
	i ir ic j jr jc ret
	dest d-i d-j
	(max-sim 0) sim
	min-det-ret det-ret
	min-det-org det-org
	min-freq freq)
    (setq i 0
	  ir situation-examples)
    (while (< i len)
      (setq ic (car ir)
	    j 0
	    jr situation-examples)
      (while (< j len)
	(unless (= i j)
	  (setq jc (car jr))
	  (setq ret (mime-compare-situation-with-example (car ic)(car jc))
		sim (car ret)
		det-ret (+ (length (car ic))(length (car jc)))
		det-org (length (cdr ret))
		freq (+ (cdr ic)(cdr jc)))
	  (cond ((< max-sim sim)
		 (setq max-sim sim
		       min-det-ret det-ret
		       min-det-org det-org
		       min-freq freq
		       d-i i
		       d-j j
		       dest (cons (cdr ret) freq))
		 )
		((= max-sim sim)
		 (cond ((> min-det-ret det-ret)
			(setq min-det-ret det-ret
			      min-det-org det-org
			      min-freq freq
			      d-i i
			      d-j j
			      dest (cons (cdr ret) freq))
			)
		       ((= min-det-ret det-ret)
			(cond ((> min-det-org det-org)
			       (setq min-det-org det-org
				     min-freq freq
				     d-i i
				     d-j j
				     dest (cons (cdr ret) freq))
			       )
			      ((= min-det-org det-org)
			       (cond ((> min-freq freq)
				      (setq min-freq freq
					    d-i i
					    d-j j
					    dest (cons (cdr ret) freq))
				      ))
			       ))
			))
		 ))
	  )
	(setq jr (cdr jr)
	      j (1+ j)))
      (setq ir (cdr ir)
	    i (1+ i)))
    (if (> d-i d-j)
	(setq i d-i
	      d-i d-j
	      d-j i))
    (setq jr (nthcdr (1- d-j) situation-examples))
    (setcdr jr (cddr jr))
    (if (= d-i 0)
	(setq situation-examples
	      (cdr situation-examples))
      (setq ir (nthcdr (1- d-i) situation-examples))
      (setcdr ir (cddr ir))
      )
    (if (setq ir (assoc (car dest) situation-examples))
	(progn
	  (setcdr ir (+ (cdr ir)(cdr dest)))
	  situation-examples)
      (cons dest situation-examples)
      ;; situation-examples may be modified.
      )))


;;; @ presentation of preview
;;;

;;; @@ entity-button
;;;

;;; @@@ predicate function
;;;

;; (defun mime-view-entity-button-visible-p (entity)
;;   "Return non-nil if header of ENTITY is visible.
;; Please redefine this function if you want to change default setting."
;;   (let ((media-type (mime-entity-media-type entity))
;;         (media-subtype (mime-entity-media-subtype entity)))
;;     (or (not (eq media-type 'application))
;;         (and (not (eq media-subtype 'x-selection))
;;              (or (not (eq media-subtype 'octet-stream))
;;                  (let ((mother-entity (mime-entity-parent entity)))
;;                    (or (not (eq (mime-entity-media-type mother-entity)
;;                                 'multipart))
;;                        (not (eq (mime-entity-media-subtype mother-entity)
;;                                 'encrypted)))
;;                    )
;;                  )))))

;;; @@@ entity button generator
;;;

(defun mime-view-insert-entity-button (entity)
  "Insert entity-button of ENTITY."
  (let ((entity-node-id (mime-entity-node-id entity))
	(params (mime-entity-parameters entity))
	(subject (mime-view-entity-title entity)))
    (mime-insert-button
     (let ((access-type (assoc "access-type" params))
	   (num (or (cdr (assoc "x-part-number" params))
		    (if (consp entity-node-id)
			(mapconcat (function
				    (lambda (num)
				      (format "%s" (1+ num))
				      ))
				   (reverse entity-node-id) ".")
		      "0"))
		))
       (cond (access-type
	      (let ((server (assoc "server" params)))
		(setq access-type (cdr access-type))
		(if server
		    (format "%s %s ([%s] %s)"
			    num subject access-type (cdr server))
		(let ((site (cdr (assoc "site" params)))
		      (dir (cdr (assoc "directory" params)))
		      (url (cdr (assoc "url" params)))
		      )
		  (if url
		      (format "%s %s ([%s] %s)"
			      num subject access-type url)
		    (format "%s %s ([%s] %s:%s)"
			    num subject access-type site dir))
		  )))
	    )
	   (t
	    (let* ((charset (cdr (assoc "charset" params)))
		   (encoding (mime-entity-encoding entity))
		   (language (mime-entity-read-field
			      entity "Content-Language"))
		   (rest (format " <%s/%s%s%s%s>"
				 (mime-entity-media-type entity)
				 (mime-entity-media-subtype entity)
				 (if language
				     (concat " (" language ")")
				   "")
				 (if charset
				     (concat "; " charset)
				   "")
				 (if encoding
				     (concat " (" encoding ")")
				   ""))))
	      (concat
	       num " " subject
	       (if (>= (+ (current-column)(length rest))(window-width))
		   "\n\t")
	       rest))
	    )))
     (function mime-preview-play-current-entity))
    ))


;;; @@ entity-header
;;;

(defvar mime-header-presentation-method-alist nil
  "Alist of major mode vs. corresponding header-presentation-method functions.
Each element looks like (SYMBOL . FUNCTION).
SYMBOL must be major mode in raw-buffer or t.  t means default.
Interface of FUNCTION must be (ENTITY SITUATION).")

(defvar mime-view-ignored-field-list
  '(".*Received:" ".*Path:" ".*Id:" "^References:"
    "^Replied:" "^Errors-To:"
    "^Lines:" "^Sender:" ".*Host:" "^Xref:"
    "^Content-Type:" "^Precedence:"
    "^Status:" "^X-VM-.*:")
  "All fields that match this list will be hidden in MIME preview buffer.
Each elements are regexp of field-name.")

(defvar mime-view-visible-field-list '("^Dnas.*:" "^Message-Id:")
  "All fields that match this list will be displayed in MIME preview buffer.
Each elements are regexp of field-name.")


;;; @@ entity-body
;;;

;;; @@@ predicate function
;;;

(in-calist-package 'mime-view)

(defun mime-calist::field-match-method-as-default-rule (calist
							field-type field-value)
  (let ((s-field (assq field-type calist)))
    (cond ((null s-field)
	   (cons (cons field-type field-value) calist)
	   )
	  (t calist))))

(define-calist-field-match-method
  'header #'mime-calist::field-match-method-as-default-rule)

(define-calist-field-match-method
  'body #'mime-calist::field-match-method-as-default-rule)

(defun mime-calist::field-match-method-ignore-case (calist
						    field-type field-value)
  (let ((s-field (assoc field-type calist)))
    (cond ((null s-field)
	   (cons (cons field-type field-value) calist))
	  ((eq field-value t)
	   calist)
	  ((string= (downcase (cdr s-field)) (downcase field-value))
	   calist))))

(define-calist-field-match-method
  'access-type #'mime-calist::field-match-method-ignore-case)


(defvar mime-preview-condition nil
  "Condition-tree about how to display entity.")

(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . octet-stream)
			   (encoding . nil)
			   (body . visible)))
(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . octet-stream)
			   (encoding . "7bit")
			   (body . visible)))
(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . octet-stream)
			   (encoding . "8bit")
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . pgp)
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . x-latex)
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . x-selection)
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition '((type . application)(subtype . x-comment)
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition '((type . message)(subtype . delivery-status)
			   (body . visible)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((body . visible)
   (body-presentation-method . mime-display-text/plain)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . nil)
   (body . visible)
   (body-presentation-method . mime-display-text/plain)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . text)(subtype . enriched)
   (body . visible)
   (body-presentation-method . mime-display-text/enriched)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . text)(subtype . richtext)
   (body . visible)
   (body-presentation-method . mime-display-text/richtext)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . text)(subtype . html)
   (body . visible)
   (body-presentation-method . mime-display-text/html)))

(autoload 'mime-display-application/x-postpet "postpet")

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . application)(subtype . x-postpet)
   (body . visible)
   (body-presentation-method . mime-display-application/x-postpet)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . text)(subtype . t)
   (body . visible)
   (body-presentation-method . mime-display-text/plain)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . multipart)(subtype . alternative)
   (body . visible)
   (body-presentation-method . mime-display-multipart/alternative)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . multipart)(subtype . related)
   (body . visible)
   (body-presentation-method . mime-display-multipart/related)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . multipart)(subtype . multilingual)
   (body . visible)
   (body-presentation-method . mime-display-multipart/multilingual)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . multipart)(subtype . t)
   (body . visible)
   (body-presentation-method . mime-display-multipart/mixed)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . message)(subtype . partial)
   (body . visible)
   (body-presentation-method . mime-display-message/partial-button)))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . message)(subtype . rfc822)
   (body . visible)
   (body-presentation-method . mime-display-message/rfc822)
   (childrens-situation (header . visible))))

(ctree-set-calist-strictly
 'mime-preview-condition
 '((type . message)(subtype . news)
   (body . visible)
   (body-presentation-method . mime-display-message/rfc822)
   (childrens-situation (header . visible))))


;;; @@@ entity presentation
;;;

(defun mime-display-insert-text-content (entity)
  (condition-case signal
      (progn (mime-insert-text-content entity)
	     (run-hooks 'mime-text-decode-hook)
	     t)
    (error   (let ((point (point)))
	       (insert (format "This entity can't be decoded.  %s"
			       (or (cadr signal) "")))
	       (add-text-properties point (point) '(face highlight)))
	     (insert "\nHere is original data.\n\n")
	     (mime-insert-entity-body entity)
	     nil)))

(defun mime-display-text/plain-flowed-parse-line ()
  (cons (point)
	(cond
	 ;; End of buffer
	 ((eobp) nil)
	 ;; Signature separator line
	 ((looking-at "\\(>+\\)? ?\\(-- \\)$")
	  (list (length (match-string 1)) 'hard (match-beginning 2)))
	 ;; Quoted line
	 ((looking-at "\\(>+\\) ?\\(.*?\\)\\( ?\\)$")
	  (list (length (match-string 1))
		(if (zerop (length (match-string 3))) t nil)
		(match-beginning 2)))
	 ;; Stuffed or normal line
	 ((looking-at " ?\\(.*?\\)\\( ?\\)$")
	  (list 0 (if (zerop (length (match-string 2))) t nil)
		(match-beginning 1)))
	 )))

(defun mime-display-text/plain-flowed (&optional buffer delete-space)
  (with-current-buffer (or (current-buffer) buffer)
    (goto-char (point-max))
    (unless (eq (char-before) ?\n)
      (insert ?\n))
    (goto-char (point-min))
    (let ((fill-column
	   (cond
	    ((and (integerp mime-display-text/plain-flowed-fill-column)
		  (< mime-display-text/plain-flowed-fill-column 1))
	     (+ (window-width) mime-display-text/plain-flowed-fill-column))
	    ((integerp mime-display-text/plain-flowed-fill-column)
	     mime-display-text/plain-flowed-fill-column)
	    ((numberp mime-display-text/plain-flowed-fill-column)
	     (floor
	      (* (window-width) mime-display-text/plain-flowed-fill-column)))
	    (mime-display-text/plain-flowed-fill-column
	     (eval mime-display-text/plain-flowed-fill-column))
	    (t fill-column)))
	  (line (mime-display-text/plain-flowed-parse-line))
	  beg-flow depth next point fill-prefix adaptive-fill-mode)
      (setq delete-space (if delete-space -2 -1))
      (while (cdr line)
	(unless (eq (point) (car line))
	  (setcar (cdr (cddr line)) (+ (nth 3 line) (- (point) (car line))))
	  (setcar line (point)))
	(forward-line)
	(setq next (mime-display-text/plain-flowed-parse-line))
	(when (or (null (cdr next))
		  (null (eq (nth 1 line) (nth 1 next)))
		  (eq (nth 2 next) 'hard))
	  (setcar (cddr line) t))
	(if beg-flow
	    ;; Following flowed line.
	    (progn
	      (delete-region (+ (car line) delete-space) (nth 3 line))
	      (when (nth 2 line)
		;; Fixed line
		(setq fill-prefix (unless (zerop depth)
				    (concat (make-string depth ?>) " ")))
		(fill-region beg-flow (point) 'left t)
		(setq beg-flow nil)))
	  ;; Following fixed line.
	  (if (zerop (nth 1 line))
	      ;; Remove stuffed space
	      (delete-region (car line) (nth 3 line))
	    (when (eq (+ (car line) (nth 1 line)) (nth 3 line))
	      ;; Insert stuffing space for quoted text
	      (setq point (point))
	      (goto-char (nth 3 line))
	      (insert 32)
	      (goto-char (1+ point))))
	  (unless (nth 2 line)
	    ;; Beginnig of flowed text
	    (setq beg-flow (car line)
		  depth (nth 1 line))))
	(setq line next)
	))))

(defun mime-display-text/plain (entity situation)
  (save-restriction
    (narrow-to-region (point-max)(point-max))
    (when (mime-display-insert-text-content entity)
      (when (not (eq (char-before (point-max)) ?\n))
	(goto-char (point-max))
	(insert "\n")
	)
      (when (equal (downcase (or (cdr (assoc "format" situation)) ""))
		   "flowed")
	(mime-display-text/plain-flowed
	 nil (equal (downcase (or (cdr (assoc "delsp" situation)) ""))
		    "yes")))
      (mime-add-url-buttons)
      (run-hooks 'mime-display-text/plain-hook)
      )))

(defun mime-display-text/richtext (entity situation)
  (save-restriction
    (narrow-to-region (point-max)(point-max))
    (when (mime-display-insert-text-content entity)
      (remove-text-properties (point-min) (point-max) '(face nil))
      (richtext-decode (point-min) (point-max))
      )))

(defun mime-display-text/enriched (entity situation)
  (save-restriction
    (narrow-to-region (point-max)(point-max))
    (when (mime-display-insert-text-content entity)
      (remove-text-properties (point-min) (point-max) '(face nil))
      (enriched-decode (point-min) (point-max))
      )))

(defun mime-display-text/html-previewer-params ()
  (and mime-view-text/html-previewer
       (or (assq mime-view-text/html-previewer
		 mime-view-text/html-previewer-alist)
	   ;; For compatibility with mime-setup-enable-inline-html.
	   (assq 'w3 mime-view-text/html-previewer-alist))))

(defun mime-display-text/html (entity situation)
  (let ((list (mime-display-text/html-previewer-params)))
    (if (and list
	     (require (nth 2 list) nil t)
	     (fboundp (nth 1 list)))
	(funcall (nth 1 list) entity situation)
      ;; text/html entity previewer is not available.
      (mime-display-text/plain entity situation))))


(defvar mime-view-announcement-for-message/partial
  (if (and (>= emacs-major-version 19) window-system)
      "\
\[[ This is message/partial style split message. ]]
\[[ Please press `v' key in this buffer          ]]
\[[ or click here by mouse button-2.             ]]"
    "\
\[[ This is message/partial style split message. ]]
\[[ Please press `v' key in this buffer.         ]]"
    ))

(defun mime-display-message/partial-button (&optional entity situation)
  (save-restriction
    (goto-char (point-max))
    (if (not (search-backward "\n\n" nil t))
	(insert "\n")
      )
    (goto-char (point-max))
    (narrow-to-region (point-max)(point-max))
    (insert mime-view-announcement-for-message/partial)
    (mime-add-button (point-min)(point-max)
		     #'mime-preview-play-current-entity)
    ))

(defun mime-display-message/rfc822 (entity situation)
  (let ((child (car (mime-entity-children entity)))
	(default-situation
	  (copy-alist
	   (delq nil (cons (assq 'major-mode situation)
			   (cdr (assq 'childrens-situation situation)))))))
    (mime-display-entity
     child nil
     (if (memq (mime-entity-media-type child)
	       '(text multipart nil))
	 (put-alist 'entity-button 'invisible default-situation)
       (put-alist 'button-position 'after default-situation)))))

(defun mime-display-multipart/mixed (entity situation)
  (let ((children (mime-entity-children entity))
	(original-major-mode-cell (assq 'major-mode situation))
	(default-situation
	  (cdr (assq 'childrens-situation situation))))
    (if original-major-mode-cell
	(setq default-situation
	      (cons original-major-mode-cell default-situation)))
    (while children
      (mime-display-entity (car children) nil default-situation)
      (setq children (cdr children))
      )))

(defvar mime-view-entity-lowest-score -1)

(defcustom mime-view-type-subtype-score-alist
  '(((text . enriched) . 3)
    ((text . richtext) . 2)
    ((text . plain)    . 1)
    ((text . html)     . mime-view-text/html-entity-score)
    (multipart . mime-view-multipart-entity-score)
    )
  "Alist MEDIA-TYPE vs corresponding score.
MEDIA-TYPE must be (TYPE . SUBTYPE), TYPE or t.  t means default.
If MEDIA-TYPE does not have corresponding score, `mime-view-entity-lowest-score' is used.
Score is integer or function or variable.  The function receives entity and returns integer."
  :group 'mime-view
  :type '(repeat (cons (choice :tag "Media-Type"
			       (cons :tag "Type/Subtype"
				     (symbol :tag "Primary-type")
				     (symbol :tag "Subtype"))
			       (symbol :tag "Type")
			       (const :tag "Default" t))
		       (choice (integer :tag "score")
			       (function :tag "function")
			       (variable :tag "variable")))))

(defun mime-view-entity-score (entity &optional situation)
  (or situation (setq situation (mime-entity-situation entity)))
  (let ((score
	 (cdr
	  (or (assoc (cons (cdr (assq 'type situation))
			   (cdr (assq 'subtype situation)))
		     mime-view-type-subtype-score-alist)
	      (assq (cdr (assq 'type situation))
		    mime-view-type-subtype-score-alist)
	      (assq t mime-view-type-subtype-score-alist)
	      ))))
    (cond
     ((functionp score)
      (setq score (funcall score entity)))
     ((and (symbolp score) (boundp score))
      (setq score (symbol-value score))))
    (if (numberp score)
	score
      mime-view-entity-lowest-score)
    ))

(defun mime-view-multipart-entity-score (entity)
  (apply 'max (or (mapcar 'mime-view-entity-score
			  (mime-entity-children entity))
		  (list (or (assq t mime-view-type-subtype-score-alist)
			    mime-view-entity-lowest-score)))))

(defun mime-view-text/html-entity-score (entity)
  ;; Module loading is done in mime-display-text/html.
  ;; So, availability is not checked here.
  (if (mime-display-text/html-previewer-params)
      mime-view-text/html-score
    mime-view-entity-lowest-score))

(defun mime-view-multipart-descendant-button (entity situation)
  (let ((default-situation
	  (delq nil (cons (assq 'major-mode situation)
			  (cdr (assq 'childrens-situation situation))))))
    (mapc
     (lambda (child)
       (setq situation (copy-alist (mime-find-entity-preview-situation
				    child default-situation)))
       (mime-display-entity
	child nil (if (eq (cdr (assq 'type situation)) 'multipart)
		      (put-alist 'body-presentation-method
				 'mime-view-multipart-descendant-button
				 situation)
		    (put-alist 'body 'invisible situation))))
     (mime-entity-children entity))))

(defun mime-display-multipart/alternative (entity situation)
  (let ((original-major-mode-cell (assq 'major-mode situation))
	(default-situation
	  (cdr (assq 'childrens-situation situation)))
	(max-score 0)
	p pairs
	child-situation score)
    (when original-major-mode-cell
      (setq default-situation
	    (cons original-major-mode-cell default-situation)))
    (setq pairs
	  (mapcar
	   (lambda (child)
	     (setq child-situation
		   (mime-find-entity-preview-situation
		    child default-situation))
	     (when (cdr (assq 'body-presentation-method child-situation))
	       (setq score (mime-view-entity-score child child-situation))
	       (when (>= score max-score)
		 (setq p child
		       max-score score)
		 ))
	     (cons child child-situation))
	   (mime-entity-children entity)))
    (or p (setq p (caar pairs)))
    (mapc (lambda (pair)
	    (mime-display-entity
	     (car pair) nil
	     (cond
	      ((eq p (car pair))
	       (cdr pair))
	      ((and mime-view-multipart/alternative-show-all-children
		    (eq (cdr (assq 'type (cdr pair))) 'multipart))
	       (put-alist 'body-presentation-method
			  'mime-view-multipart-descendant-button
			  (copy-alist (cdr pair))))
	      (t (put-alist 'body 'invisible (copy-alist (cdr pair)))))))
	  pairs)
    ))

(defun mime-display-multipart/related (entity situation)
  (let* ((param-start (mime-parse-msg-id
		       (std11-lexical-analyze
			(cdr (assoc "start"
				    (mime-content-type-parameters
				     (mime-entity-content-type entity)))))))
	 (start (or (and param-start (mime-find-entity-from-content-id
				      param-start
				      entity))
		    (car (mime-entity-children entity))))
	 (original-major-mode-cell (assq 'major-mode situation))
	 (default-situation (cdr (assq 'childrens-situation situation))))
    (if original-major-mode-cell
	(setq default-situation
	      (cons original-major-mode-cell default-situation)))
    (mapc
     (lambda (child)
       (cond
	((eq start child)
	 (mime-display-entity start nil default-situation))
	(mime-view-multipart/related-show-all-children
	 (let ((child-situation (copy-alist (mime-find-entity-preview-situation
					     child default-situation))))
	   (mime-display-entity
	    child nil
	    (if (eq (mime-entity-media-type child) 'multipart)
		(put-alist 'body-presentation-method
			   'mime-view-multipart-descendant-button
			   child-situation)
	      (put-alist 'body 'invisible child-situation)))))))
     (mime-entity-children entity))))

(defun mime-display-multipart/multilingual-select-interactively (pairs)
  (let (count counts result elt)
    (setq pairs
	  (dolist (pair pairs (nreverse result))
	    (when (caar pair)
	      (setq elt (format "%s/%s"
				(or (caar pair) "")
				(or (cdar pair)
				    mime-display-multipart/multilingual-unknown-translation-type)))
	      (if (setq count (assoc elt counts))
		  (setq elt
			(format "%s:%d" elt (setcdr count (1+ (cdr count)))))
		(setq counts (cons (cons elt 1) counts)))
	      (setq result (cons (cons elt (cdr pair)) result)))))
    (when (> (length pairs) 0)
      (cdr (assoc
	    (completing-read
	     "Which language is displayed for this multilingual message? "
	     (mapcar 'car pairs) nil t nil nil (caar pairs))
	    pairs)))))

(defun mime-display-multipart/multilingual-select-automatically (pairs)
  (let ((max-score '(0 . 0))
	(case-fold-search t)
	score choice first zxx)
    (dolist (pair pairs)
      (when (caar pair)
	(unless first
	  ;; The first language message part
	  (setq first (cdr pair)))
	(when (string-match "^zxx$" (caar pair))
	  ;; The language-independent message part
	  (setq zxx (cdr pair)))
	(setq score
	      (cons
	       (let ((langs
		      mime-display-multipart/multilingual-prefered-languages))
		 (catch 'done
		   (while langs
		     (when (string-match (car langs) (caar pair))
		       (throw 'done (length langs)))
		     (setq langs (cdr langs)))
		   -1))
	       (or
		(cdr
		 (assoc
		  (or (cdar pair)
		      mime-display-multipart/multilingual-unknown-translation-type)
		  mime-display-multipart/multilingual-translation-type-score))
		-1)))
	(when (or (> (cdr score) (cdr max-score))
		  (and (eq (cdr score) (cdr max-score))
		       (> (car score) (car max-score))))
	  (setq max-score score)
	  (setq choice (cdr pair)))))
    (or choice zxx first)))

(defun mime-display-multipart/multilingual (entity situation)
  "MIME-View mode preview method for multipart/multilingual entity.
When `mime-display-multipart/multilingual-interactive' is nil, select child entity to display automatically.
Automatic selection algorithm is below.

1. Select highest score entity calculated from
Content-Translation-Type: field and
`mime-display-multipart/multilingual-translation-type-score'.
But if score is negative, never selected.
2. If there are multiple highest score entities, select entities
whose Content-Language: field values matches former element of
`mime-display-multipart/multilingual-prefered-languages'.  If not
matched, never selected.
3. If no entity is selected, select the language-independent
part (if exist) or the first language message part."
  (let ((default-situation
	  (delq nil (cons (assq 'major-mode situation)
			  (cdr (assq 'childrens-situation situation)))))
	child-situation score choice pairs)
    (setq pairs
	  (mapcar
	   (lambda (child)
	     (cons (cons
		    (cdr (assq 'atom
			       (std11-lexical-analyze
				(mime-entity-read-field
				 child "Content-Language"))))
		    (cdr (assq 'atom
			       (std11-lexical-analyze
				(mime-entity-fetch-field
				 child "Content-Translation-Type")))))
		   child))
	   (mime-entity-children entity)))
    (setq choice
	  (if mime-display-multipart/multilingual-interactive
	      (mime-display-multipart/multilingual-select-interactively pairs)
	    (mime-display-multipart/multilingual-select-automatically pairs)))
    (mapc (lambda (child)
	    (mime-display-entity
	     child nil
	     (if (eq choice child)
		 default-situation
	       (put-alist 'body 'invisible
			  (copy-alist (mime-find-entity-preview-situation
				       child default-situation))))))
	  (mime-entity-children entity))
    ))

;;; @ acting-condition
;;;

(defvar mime-acting-condition nil
  "Condition-tree about how to process entity.")

(defun mime-view-read-mailcap-files (&optional files)
  (or files
      (setq files
	    (if mime-mailcap-file
		(cons mime-mailcap-file
		      (remove mime-mailcap-file mime-view-mailcap-files))
	      mime-view-mailcap-files)))
  (let (entries file)
    (while files
      (setq file (car files))
      (if (file-readable-p file)
	  (setq entries (append entries (mime-parse-mailcap-file file))))
      (setq files (cdr files)))
    (while entries
      (let ((entry (car entries))
	    view print shared)
	(while entry
	  (let* ((field (car entry))
		 (field-type (car field)))
	    (cond ((eq field-type 'view)  (setq view field))
		  ((eq field-type 'print) (setq print field))
		  ((memq field-type '(compose composetyped edit)))
		  (t (setq shared (cons field shared))))
	    )
	  (setq entry (cdr entry)))
	(setq shared (nreverse shared))
	(ctree-set-calist-with-default
	 'mime-acting-condition
	 (append shared (list '(mode . "play")(cons 'method (cdr view)))))
	(if print
	    (ctree-set-calist-with-default
	     'mime-acting-condition
	     (append shared
		     (list '(mode . "print")(cons 'method (cdr view)))))))
      (setq entries (cdr entries)))))

(mime-view-read-mailcap-files)

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . application)(subtype . octet-stream)
   (mode . "play")
   (method . mime-detect-content)
   ))

(ctree-set-calist-with-default
 'mime-acting-condition
 '((mode . "extract")
   (method . mime-save-content)))

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . text)(subtype . x-rot13-47)(mode . "play")
   (method . mime-view-caesar)
   ))
(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . text)(subtype . x-rot13-47-48)(mode . "play")
   (method . mime-view-caesar)
   ))

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . message)(subtype . rfc822)(mode . "play")
   (method . mime-view-message/rfc822)
   ))
(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . message)(subtype . partial)(mode . "play")
   (method . mime-store-message/partial-piece)
   ))

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . message)(subtype . external-body)
   ("access-type" . "anon-ftp")
   (method . mime-view-message/external-anon-ftp)
   ))

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . message)(subtype . external-body)
   ("access-type" . "url")
   (method . mime-view-message/external-url)
   ))

(ctree-set-calist-strictly
 'mime-acting-condition
 '((type . application)(subtype . octet-stream)
   (method . mime-save-content)
   ))


;;; @ quitting method
;;;

(defvar mime-preview-quitting-method-alist
  '((mime-show-message-mode
     . mime-preview-quitting-method-for-mime-show-message-mode))
  "Alist of major-mode vs. quitting-method of mime-view.")

(defvar mime-preview-over-to-previous-method-alist nil
  "Alist of major-mode vs. over-to-previous-method of mime-view.")

(defvar mime-preview-over-to-next-method-alist nil
  "Alist of major-mode vs. over-to-next-method of mime-view.")


;;; @ following method
;;;

(defvar mime-preview-following-method-alist nil
  "Alist of major-mode vs. following-method of mime-view.")

(defvar mime-view-following-required-fields-list
  '("From"))


;;; @ buffer setup
;;;

(defun mime-display-entity-visible-p (elements situation &optional default)
  (catch 'done
    (let (result)
      (while elements
	(when (setq result (cdr (assq (car elements) situation)))
	  (unless (memq result '(visible invisible))
	    (setq result (cond ((functionp result)
				(funcall result situation))
			       ((and (symbolp result) (boundp result))
				(symbol-value result))
			       (t default))))
	  ;; Non-nil values other than invisible are treated as
	  ;; visible.
	  (throw 'done (if (memq result '(invisible nil))
			   nil t)))
	(setq elements (cdr elements))))
    default))

(defun mime-display-entity (entity &optional situation
				   default-situation preview-buffer)
  (or preview-buffer
      (setq preview-buffer (current-buffer)))
  (let* (nb ne nbb)
    (in-calist-package 'mime-view)
    (or situation
	(setq situation
	      (mime-find-entity-preview-situation entity default-situation)))
    (let ((button-is-visible
	   (and mime-view-buttons-visible
		(mime-display-entity-visible-p
		 '(*entity-button entity-button) situation t)))
	  (button-position (cdr (assq 'button-position situation)))
	  (header-is-visible
	   (mime-display-entity-visible-p '(*header header) situation))
	  (body-is-visible
	   (mime-display-entity-visible-p '(*body body) situation))
	  (children (mime-entity-children entity)))
      (set-buffer preview-buffer)
      (setq nb (point))
      (narrow-to-region nb nb)
      (if header-is-visible
	  (let ((header-presentation-method
		 (or (cdr (assq 'header-presentation-method situation))
		     (cdr (assq (cdr (assq 'major-mode situation))
				mime-header-presentation-method-alist)))))
	    (if header-presentation-method
		(funcall header-presentation-method entity situation)
	      (mime-insert-header entity
				  mime-view-ignored-field-list
				  mime-view-visible-field-list))
	    (run-hooks 'mime-display-header-hook)
	    (put-text-property nb (point-max) 'mime-view-entity-header entity)
	    (goto-char (point-max))
	    (insert "\n")))
      (when button-is-visible
	(unless (eq button-position 'after)
	  (goto-char (point-min)))
	(mime-view-insert-entity-button entity)
	(goto-char (point-max)))
      (setq nbb (point))
      (unless children
	(when body-is-visible
	  (let ((body-presentation-method
		 (cdr (assq 'body-presentation-method situation))))
	    (if (functionp body-presentation-method)
		(funcall body-presentation-method entity situation)
	      (mime-display-text/plain entity situation))))
	(goto-char (point-max))
	;; Insert LF if needed.
	(unless (eq (char-before) 10) (insert 10)))
      (setq ne (or (next-single-property-change nb 'mime-view-entity)
		   (point-max)))
      (widen)
      (put-text-property nb ne 'mime-view-entity entity)
      (put-text-property nb ne 'mime-view-situation situation)
      (put-text-property nbb ne 'mime-view-entity-body entity)
      (goto-char ne)
      (if (and children body-is-visible)
	  (let ((body-presentation-method
		 (cdr (assq 'body-presentation-method situation))))
	    (if (functionp body-presentation-method)
		(funcall body-presentation-method entity situation)
	      (mime-display-multipart/mixed entity situation))))
      )))


;;; @ MIME viewer mode
;;;

(defconst mime-view-menu-title "MIME-View")
(defconst mime-view-menu-list
  '((up		 "Move to upper entity"    mime-preview-move-to-upper)
    (previous	 "Move to previous entity" mime-preview-move-to-previous)
    (next	 "Move to next entity"	   mime-preview-move-to-next)
    (scroll-down "Scroll-down"             mime-preview-scroll-down-entity)
    (scroll-up	 "Scroll-up"               mime-preview-scroll-up-entity)
    (play	 "Play current entity"     mime-preview-play-current-entity)
    (extract	 "Extract current entity"  mime-preview-extract-current-entity)
    (print	 "Print current entity"    mime-preview-print-current-entity)
    )
  "Menu for MIME Viewer")

(cond ((featurep 'xemacs)
       (defvar mime-view-xemacs-popup-menu
	 (cons mime-view-menu-title
	       (mapcar (function
			(lambda (item)
			  (vector (nth 1 item)(nth 2 item) t)
			  ))
		       mime-view-menu-list)))
       (defun mime-view-xemacs-popup-menu (event)
	 "Popup the menu in the MIME Viewer buffer"
	 (interactive "e")
	 (select-window (event-window event))
	 (set-buffer (event-buffer event))
	 (popup-menu 'mime-view-xemacs-popup-menu))
       (defvar mouse-button-2 'button2)
       (defvar mouse-button-3 'button3)
       )
      (t
       (defvar mime-view-popup-menu 
         (let ((menu (make-sparse-keymap mime-view-menu-title)))
           (nconc menu
                  (mapcar (function
                           (lambda (item)
                             (list (intern (nth 1 item)) 'menu-item 
                                   (nth 1 item)(nth 2 item))
                             ))
                          mime-view-menu-list))))
       (defun mime-view-popup-menu (event)
         "Popup the menu in the MIME Viewer buffer"
         (interactive "@e")
         (let ((menu mime-view-popup-menu) events func)
           (setq events (x-popup-menu t menu))
           (and events
                (setq func (lookup-key menu (apply #'vector events)))
                (commandp func)
                (funcall func))))
       (defvar mouse-button-2 [mouse-2])
       (defvar mouse-button-3 [mouse-3])
       ))

(defun mime-view-define-keymap (&optional default)
  (let ((mime-view-mode-map (if (keymapp default)
				(copy-keymap default)
			      (make-sparse-keymap))))
    (define-key mime-view-mode-map
      "u"        (function mime-preview-move-to-upper))
    (define-key mime-view-mode-map
      "p"        (function mime-preview-move-to-previous))
    (define-key mime-view-mode-map
      "n"        (function mime-preview-move-to-next))
    (define-key mime-view-mode-map
      "\e\t"     (function mime-preview-move-to-previous))
    (define-key mime-view-mode-map
      "\t"       (function mime-preview-move-to-next))
    (define-key mime-view-mode-map
      " "        (function mime-preview-scroll-up-entity))
    (define-key mime-view-mode-map
      "\M- "     (function mime-preview-scroll-down-entity))
    (define-key mime-view-mode-map
      "\177"     (function mime-preview-scroll-down-entity))
    (define-key mime-view-mode-map
      "\C-m"     (function mime-preview-next-line-entity))
    (define-key mime-view-mode-map
      "\C-\M-m"  (function mime-preview-previous-line-entity))
    (define-key mime-view-mode-map
      "v"        (function mime-preview-play-current-entity))
    (define-key mime-view-mode-map
      "e"        (function mime-preview-extract-current-entity))
    (define-key mime-view-mode-map
      "\C-c\C-p" (function mime-preview-print-current-entity))

    (define-key mime-view-mode-map
      "\C-c\C-t\C-f" (function mime-preview-toggle-header))
    (define-key mime-view-mode-map
      "\C-c\C-th" (function mime-preview-toggle-header))
    (define-key mime-view-mode-map
      "\C-c\C-t\C-c" (function mime-preview-toggle-content))

    (define-key mime-view-mode-map
      "\C-c\C-v\C-f" (function mime-preview-show-header))
    (define-key mime-view-mode-map
      "\C-c\C-vh" (function mime-preview-show-header))
    (define-key mime-view-mode-map
      "\C-c\C-v\C-c" (function mime-preview-show-content))

    (define-key mime-view-mode-map
      "\C-c\C-d\C-f" (function mime-preview-hide-header))
    (define-key mime-view-mode-map
      "\C-c\C-dh" (function mime-preview-hide-header))
    (define-key mime-view-mode-map
      "\C-c\C-d\C-c" (function mime-preview-hide-content))

    (define-key mime-view-mode-map
      "a"        (function mime-preview-follow-current-entity))
    (define-key mime-view-mode-map
      "q"        (function mime-preview-quit))
    (define-key mime-view-mode-map
      "\C-c\C-x" (function mime-preview-kill-buffer))
    ;; (define-key mime-view-mode-map
    ;;   "<"        (function beginning-of-buffer))
    ;; (define-key mime-view-mode-map
    ;;   ">"        (function end-of-buffer))
    (define-key mime-view-mode-map
      "?"        (function describe-mode))
    (define-key mime-view-mode-map
      [tab] (function mime-preview-move-to-next))
    (define-key mime-view-mode-map
      [delete] (function mime-preview-scroll-down-entity))
    (define-key mime-view-mode-map
      [backspace] (function mime-preview-scroll-down-entity))
    (if (functionp default)
	(cond ((featurep 'xemacs)
	       (set-keymap-default-binding mime-view-mode-map default)
	       )
	      (t
	       (setq mime-view-mode-map
		     (append mime-view-mode-map (list (cons t default))))
	       )))
    (if mouse-button-2
	(define-key mime-view-mode-map
	  mouse-button-2 (function mime-button-dispatcher))
      )
    (cond ((featurep 'xemacs)
	   (define-key mime-view-mode-map
	     mouse-button-3 (function mime-view-xemacs-popup-menu))
	   )
	  ((>= emacs-major-version 19)
	   (define-key mime-view-mode-map
             mouse-button-3 (function mime-view-popup-menu))
	   (define-key mime-view-mode-map [menu-bar mime-view]
	     (cons mime-view-menu-title
		   (make-sparse-keymap mime-view-menu-title)))
	   (mapc (function
		  (lambda (item)
		    (define-key mime-view-mode-map
		      (vector 'menu-bar 'mime-view (car item))
		      (cons (nth 1 item)(nth 2 item)))
		    ))
		 (reverse mime-view-menu-list))
	   ))
    ;; (run-hooks 'mime-view-define-keymap-hook)
    mime-view-mode-map))

(defvar mime-view-mode-default-map (mime-view-define-keymap))


(defsubst mime-maybe-hide-echo-buffer ()
  "Clear mime-echo buffer and delete window for it."
  (let ((buf (get-buffer mime-echo-buffer-name)))
    (if buf
	(with-current-buffer buf
	  (erase-buffer)
	  (let ((win (get-buffer-window buf)))
	    (if win
		(delete-window win)
	      ))
	  (bury-buffer buf)
	  ))))

(defvar mime-view-redisplay nil)

;;;###autoload
(defun mime-display-message (message &optional preview-buffer
				     mother default-keymap-or-function
				     original-major-mode keymap)
  "View MESSAGE in MIME-View mode.

Optional argument PREVIEW-BUFFER specifies the buffer of the
presentation.  It must be either nil or a name of preview buffer.

Optional argument MOTHER specifies mother-buffer of the preview-buffer.

Optional argument DEFAULT-KEYMAP-OR-FUNCTION is nil, keymap or
function.  If it is a keymap, keymap of MIME-View mode will be added
to it.  If it is a function, it will be bound as default binding of
keymap of MIME-View mode.

Optional argument ORIGINAL-MAJOR-MODE is major-mode of representation
buffer of MESSAGE.  If it is nil, current `major-mode' is used.

Optional argument KEYMAP is keymap of MIME-View mode.  If it is
non-nil, DEFAULT-KEYMAP-OR-FUNCTION is ignored.  If it is nil,
`mime-view-mode-default-map' is used."
  (mime-maybe-hide-echo-buffer)
  (let ((win-conf (current-window-configuration)))
    (or preview-buffer
	(setq preview-buffer
	      (concat "*Preview-" (mime-entity-name message) "*")))
    (or original-major-mode
	(setq original-major-mode major-mode))
    (let ((inhibit-read-only t))
      (set-buffer (get-buffer-create preview-buffer))
      (widen)
      (erase-buffer)
      (if mother
	  (setq mime-mother-buffer mother))
      (setq mime-preview-original-window-configuration win-conf)
      (setq major-mode 'mime-view-mode)
      (setq mode-name "MIME-View")
      ;; Do not hide button when first entity is
      ;; neither text nor multipart.
      (mime-display-entity
       message nil `(,(if (memq (mime-entity-media-type message)
				'(text multipart nil))
			  '(entity-button . invisible)
			'(button-position . after))
		     (header . visible)
		     (major-mode . ,original-major-mode))
       preview-buffer)
      (use-local-map
       (or keymap
	   (if default-keymap-or-function
	       (mime-view-define-keymap default-keymap-or-function)
	     mime-view-mode-default-map)))
      (let ((point
	     (next-single-property-change (point-min) 'mime-view-entity)))
	(if point
	    (goto-char point)
	  (goto-char (point-min))
	  (search-forward "\n\n" nil t)))
      (run-hooks 'mime-view-mode-hook)
      (set-buffer-modified-p nil)
      (setq buffer-read-only t)
      preview-buffer)))

;;;###autoload
(defun mime-view-buffer (&optional raw-buffer preview-buffer mother
				   default-keymap-or-function
				   representation-type)
  "View RAW-BUFFER in MIME-View mode.
Optional argument PREVIEW-BUFFER is either nil or a name of preview
buffer.
Optional argument DEFAULT-KEYMAP-OR-FUNCTION is nil, keymap or
function.  If it is a keymap, keymap of MIME-View mode will be added
to it.  If it is a function, it will be bound as default binding of
keymap of MIME-View mode.
Optional argument REPRESENTATION-TYPE is representation-type of
message.  It must be nil, `binary' or `cooked'.  If it is nil,
`cooked' is used as default."
  (interactive)
  (or raw-buffer
      (setq raw-buffer (current-buffer)))
  (or representation-type
      (setq representation-type
	    ;; Do not use `with-current-buffer'.
	    ;; raw-buffer may be the current buffer.
	    (save-excursion
	      (set-buffer raw-buffer)
	      (cdr (or (assq major-mode mime-raw-representation-type-alist)
		       (assq t mime-raw-representation-type-alist)))
	      )))
  (if (eq representation-type 'binary)
      (setq representation-type 'buffer)
    )
  (setq preview-buffer (mime-display-message
			(mime-open-entity representation-type raw-buffer)
			preview-buffer mother default-keymap-or-function))
  (or (get-buffer-window preview-buffer)
      (let ((r-win (get-buffer-window raw-buffer)))
	(if r-win
	    (set-window-buffer r-win preview-buffer)
	  (let ((m-win (and mother (get-buffer-window mother))))
	    (if m-win
		(set-window-buffer m-win preview-buffer)
	      (switch-to-buffer preview-buffer)
	      ))))))

(defun mime-view-mode (&optional mother ctl encoding
				 raw-buffer preview-buffer
				 default-keymap-or-function)
  "Major mode for viewing MIME message.

Here is a list of the standard keys for mime-view-mode.

key		feature
---		-------

u		Move to upper content
p or M-TAB	Move to previous content
n or TAB	Move to next content
SPC		Scroll up or move to next content
M-SPC or DEL	Scroll down or move to previous content
RET		Move to next line
M-RET		Move to previous line
v		Decode current content as `play mode'
e		Decode current content as `extract mode'
C-c C-p		Decode current content as `print mode'
a		Followup to current content.
q		Quit
button-2	Move to point under the mouse cursor
        	and decode current content as `play mode'
"
  (interactive)
  (unless mime-view-redisplay
    (save-excursion
      (if raw-buffer (set-buffer raw-buffer))
      (let ((type
	     (cdr
	      (or (assq major-mode mime-raw-representation-type-alist)
		  (assq t mime-raw-representation-type-alist)))))
	(if (eq type 'binary)
	    (setq type 'buffer)
	  )
	(setq mime-message-structure (mime-open-entity type raw-buffer))
	(or (mime-entity-content-type mime-message-structure)
	    (mime-entity-set-content-type mime-message-structure ctl))
	)
      (or (mime-entity-encoding mime-message-structure)
	  (mime-entity-set-encoding mime-message-structure encoding))
      ))
  (mime-display-message mime-message-structure preview-buffer
			mother default-keymap-or-function)
  )


;;; @@ utility
;;;

(defun mime-preview-find-boundary-info (&optional with-children)
  "Return boundary information of current part.
If WITH-CHILDREN, refer boundary surrounding current part and its branches."
  (let (entity
	p-beg p-end
	entity-node-id len)
    (while (and
	    (null (setq entity
			(get-text-property (point) 'mime-view-entity)))
	    (> (point) (point-min)))
      (backward-char))
    (setq p-beg (previous-single-property-change (point) 'mime-view-entity))
    (setq entity-node-id (and entity (mime-entity-node-id entity)))
    (setq len (length entity-node-id))
    (cond ((null p-beg)
	   (setq p-beg
		 (if (eq (next-single-property-change (point-min)
						      'mime-view-entity)
			 (point))
		     (point)
		   (point-min)))
	   )
	  ((eq (next-single-property-change p-beg 'mime-view-entity)
	       (point))
	   (setq p-beg (point))
	   ))
    (setq p-end (next-single-property-change p-beg 'mime-view-entity))
    (cond ((null p-end)
	   (setq p-end (point-max))
	   )
	  ((null entity-node-id)
	   (setq p-end (point-max))
	   )
	  (with-children
	   (save-excursion
	     (catch 'tag
	       (let (e i)
		 (while (setq e
			      (next-single-property-change
			       (point) 'mime-view-entity))
		   (goto-char e)
		   (let ((rc (mime-entity-node-id
			      (get-text-property (point)
						 'mime-view-entity))))
		     (or (and (>= (setq i (- (length rc) len)) 0)
			      (equal entity-node-id (nthcdr i rc)))
			 (throw 'tag nil)))
		   (setq p-end (or (next-single-property-change
				    (point) 'mime-view-entity)
				   (point-max)))))
	       (setq p-end (point-max))))
	   ))
    (vector p-beg p-end entity)))


;;; @@ playing
;;;

(autoload 'mime-preview-play-current-entity "mime-play"
  "Play current entity." t)

(defun mime-preview-extract-current-entity (&optional ignore-examples)
  "Extract current entity into file (maybe).
It decodes current entity to call internal or external method as
\"extract\" mode.  The method is selected from variable
`mime-acting-condition'."
  (interactive "P")
  (mime-preview-play-current-entity ignore-examples "extract")
  )

(defun mime-preview-print-current-entity (&optional ignore-examples)
  "Print current entity (maybe).
It decodes current entity to call internal or external method as
\"print\" mode.  The method is selected from variable
`mime-acting-condition'."
  (interactive "P")
  (mime-preview-play-current-entity ignore-examples "print")
  )


;;; @@ following
;;;

(defun mime-preview-follow-current-entity ()
  "Write follow message to current entity.
It calls following-method selected from variable
`mime-preview-following-method-alist'."
  (interactive)
  (let* ((boundary-info (mime-preview-find-boundary-info t))
	 (p-beg (aref boundary-info 0))
	 (p-end (aref boundary-info 1))
	 (entity (aref boundary-info 2))
	 pb-beg)
    (if (or (get-text-property p-beg 'mime-view-entity-body)
	    (null entity))
	(setq pb-beg p-beg)
      (setq pb-beg
	    (next-single-property-change
	     p-beg 'mime-view-entity-body nil
	     (or (next-single-property-change p-beg 'mime-view-entity)
		 p-end))))
    (let* ((mode (mime-preview-original-major-mode 'recursive))
	   (entity-node-id (and entity (mime-entity-node-id entity)))
	   (new-name
	    (format "%s-%s" (buffer-name) (reverse entity-node-id)))
	   new-buf
	   (the-buf (current-buffer))
	   fields)
      ;; Do not use `with-current-buffer'.  Inner save-excursion(),
      ;; the current buffer may be accessed.
      (save-excursion
	(set-buffer (setq new-buf (get-buffer-create new-name)))
	(erase-buffer)
	(insert ?\n)
	(insert-buffer-substring the-buf pb-beg p-end)
	(goto-char (point-min))
	(let ((current-entity
	       (if (and entity
			(eq (mime-entity-media-type entity) 'message)
			(eq (mime-entity-media-subtype entity) 'rfc822))
		   (car (mime-entity-children entity))
		 entity)))
	  (while (and current-entity
		      (if (and (eq (mime-entity-media-type
				    current-entity) 'message)
			       (eq (mime-entity-media-subtype
				    current-entity) 'rfc822))
			  nil
			(mime-insert-header current-entity fields)
			t))
	    (setq fields (std11-collect-field-names)
		  current-entity (mime-entity-parent current-entity))
	    ))
	(let ((rest mime-view-following-required-fields-list)
	      field-name ret)
	  (while rest
	    (setq field-name (car rest))
	    (or (std11-field-body field-name)
		(progn
		  (with-current-buffer the-buf
		    (let ((entity (when mime-mother-buffer
				    (set-buffer mime-mother-buffer)
				    (get-text-property (point)
						       'mime-view-entity))))
		      (while (and entity
				  (null (setq ret (mime-entity-fetch-field
						   entity field-name))))
			(setq entity (mime-entity-parent entity)))))
		  (if ret
		      (insert field-name ": " ret "\n")
		    )))
	    (setq rest (cdr rest))
	    ))
	)
      (let ((f (cdr (assq mode mime-preview-following-method-alist))))
	(if (functionp f)
	    (funcall f new-buf)
	  (message
	   "Sorry, following method for %s is not implemented yet."
	   mode)
	  ))
      )))


;;; @@ moving
;;;

(defun mime-preview-move-to-upper ()
  "Move to upper entity.
If there is no upper entity, call function `mime-preview-quit'."
  (interactive)
  (let (cinfo)
    (while (null (setq cinfo
		       (get-text-property (point) 'mime-view-entity)))
      (backward-char)
      )
    (let ((r (mime-entity-parent cinfo))
	  point)
      (catch 'tag
	(while (setq point (previous-single-property-change
			    (point) 'mime-view-entity))
	  (goto-char point)
	  (when (eq r (get-text-property (point) 'mime-view-entity))
	    (if (or (eq mime-preview-move-scroll t)
		    (and mime-preview-move-scroll
			 (>= point
			     (save-excursion
			       (move-to-window-line -1)
			       (forward-line (* -1 next-screen-context-lines))
			       (beginning-of-line)
			       (point)))))
		(recenter next-screen-context-lines))
	    (throw 'tag t)
	    )
	  )
	(mime-preview-quit)
	))))

(defun mime-preview-move-to-previous ()
  "Move to previous entity.
If there is no previous entity, it calls function registered in
variable `mime-preview-over-to-previous-method-alist'."
  (interactive)
  (while (and (not (bobp))
	      (null (get-text-property (point) 'mime-view-entity)))
    (backward-char)
    )
  (let ((point (previous-single-property-change (point) 'mime-view-entity)))
    (if (and point
	     (>= point (point-min)))
	(if (get-text-property (1- point) 'mime-view-entity)
	    (progn (goto-char point)
		   (if
		    (or (eq mime-preview-move-scroll t)
			(and mime-preview-move-scroll
			     (<= point
				(save-excursion
				  (move-to-window-line 0)
				  (forward-line next-screen-context-lines)
				  (end-of-line)
				  (point)))))
			(recenter (* -1 next-screen-context-lines))))
	  (goto-char (1- point))
	  (mime-preview-move-to-previous)
	  )
      (let ((f (assq (mime-preview-original-major-mode)
		     mime-preview-over-to-previous-method-alist)))
	(if f
	    (funcall (cdr f))
	  ))
      )))

(defun mime-preview-move-to-next ()
  "Move to next entity.
If there is no previous entity, it calls function registered in
variable `mime-preview-over-to-next-method-alist'."
  (interactive)
  (while (and (not (eobp))
	      (null (get-text-property (point) 'mime-view-entity)))
    (forward-char)
    )
  (let ((point (next-single-property-change (point) 'mime-view-entity)))
    (if (and point
	     (<= point (point-max)))
	(progn
	  (goto-char point)
	  (if (null (get-text-property point 'mime-view-entity))
	      (mime-preview-move-to-next)
	    (and
	     (or (eq mime-preview-move-scroll t)
		 (and mime-preview-move-scroll
		      (>= point
			 (save-excursion
			   (move-to-window-line -1)
			   (forward-line
			    (* -1 next-screen-context-lines))
			   (beginning-of-line)
			   (point)))))
		 (recenter next-screen-context-lines))
	    ))
      (let ((f (assq (mime-preview-original-major-mode)
		     mime-preview-over-to-next-method-alist)))
	(if f
	    (funcall (cdr f))
	  ))
      )))

(defun mime-preview-scroll-up-entity (&optional h)
  "Scroll up current entity.
If reached to (point-max), it calls function registered in variable
`mime-preview-over-to-next-method-alist'."
  (interactive)
  (if (eobp)
      (let ((f (assq (mime-preview-original-major-mode)
		     mime-preview-over-to-next-method-alist)))
	(if f
	    (funcall (cdr f))
	  ))
    (let ((point
	   (or (next-single-property-change (point) 'mime-view-entity)
	       (point-max)))
	  (bottom (window-end (selected-window))))
      (if (and (not h)
	       (> bottom point))
	  (progn (goto-char point)
		 (recenter next-screen-context-lines))
	(condition-case nil
	    (scroll-up h)
	  (end-of-buffer
	   (goto-char (point-max)))))
      )))

(defun mime-preview-scroll-down-entity (&optional h)
  "Scroll down current entity.
If reached to (point-min), it calls function registered in variable
`mime-preview-over-to-previous-method-alist'."
  (interactive)
  (if (bobp)
      (let ((f (assq (mime-preview-original-major-mode)
		     mime-preview-over-to-previous-method-alist)))
	(if f
	    (funcall (cdr f))
	  ))
    (let ((point
	   (or (previous-single-property-change (point) 'mime-view-entity)
	       (point-min)))
	  (top (window-start (selected-window))))
      (if (and (not h)
	       (< top point))
	  (progn (goto-char point)
		 (recenter (* -1 next-screen-context-lines)))
	(condition-case nil
	    (scroll-down h)
	  (beginning-of-buffer
	   (goto-char (point-min)))))
      )))

(defun mime-preview-next-line-entity (&optional lines)
  "Scroll up one line (or prefix LINES lines).
If LINES is negative, scroll down LINES lines."
  (interactive "p")
  (mime-preview-scroll-up-entity (or lines 1))
  )

(defun mime-preview-previous-line-entity (&optional lines)
  "Scrroll down one line (or prefix LINES lines).
If LINES is negative, scroll up LINES lines."
  (interactive "p")
  (mime-preview-scroll-down-entity (or lines 1))
  )


;;; @@ display
;;;

(defun mime-preview-toggle-display (type &optional display)
  (let ((situation (mime-preview-find-boundary-info t))
	(sym (intern (concat "*" (symbol-name type))))
	entity p-beg p-end)
    (setq p-beg (aref situation 0)
	  p-end (aref situation 1)
	  entity (aref situation 2)
	  situation (get-text-property p-beg 'mime-view-situation))
    (cond ((eq display 'invisible)
	   (setq display nil))
	  (display)
	  (t
	   (setq display
		 (memq (cdr (or (assq sym situation)
				(assq type situation)))
		       '(nil invisible)))))
    (setq situation (put-alist sym (if display
				       'visible
				     'invisible)
			       situation))
    (save-excursion
      (let ((inhibit-read-only t))
	(delete-region p-beg p-end)
	(mime-display-entity entity situation)))
    (let ((ret (assoc situation mime-preview-situation-example-list)))
      (if ret
	  (setcdr ret (1+ (cdr ret)))
	(add-to-list 'mime-preview-situation-example-list
		     (cons situation 0))))))

(defun mime-preview-toggle-header (&optional force-visible)
  (interactive "P")
  (mime-preview-toggle-display 'header force-visible))

(defun mime-preview-toggle-content (&optional force-visible)
  (interactive "P")
  (mime-preview-toggle-display 'body force-visible))

(defun mime-preview-show-header ()
  (interactive)
  (mime-preview-toggle-display 'header 'visible))

(defun mime-preview-show-content ()
  (interactive)
  (mime-preview-toggle-display 'body 'visible))

(defun mime-preview-hide-header ()
  (interactive)
  (mime-preview-toggle-display 'header 'invisible))

(defun mime-preview-hide-content ()
  (interactive)
  (mime-preview-toggle-display 'body 'invisible))

    
;;; @@ quitting
;;;

(defun mime-preview-quit ()
  "Quit from MIME-preview buffer.
It calls function registered in variable
`mime-preview-quitting-method-alist'."
  (interactive)
  (let ((r (assq (mime-preview-original-major-mode)
		 mime-preview-quitting-method-alist)))
    (if r
	(funcall (cdr r))
      )))

(defun mime-preview-kill-buffer ()
  (interactive)
  (kill-buffer (current-buffer))
  )


;;; @ end
;;;

(provide 'mime-view)

(mime-view-read-situation-examples-file)

;;; mime-view.el ends here
