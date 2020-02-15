;;; mime-parse.el --- MIME message parser

;; Copyright (C) 1994,95,96,97,98,99,2001 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <morioka@jaist.ac.jp>
;;	Shuhei KOBAYASHI <shuhei@aqua.ocn.ne.jp>
;; Keywords: parse, MIME, multimedia, mail, news

;; This file is part of FLIM (Faithful Library about Internet Message).

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

(require 'custom)
(require 'pccl)
(require 'broken)

(require 'mime-def)
(require 'luna)
(require 'std11)

(autoload 'mime-entity-body-buffer "mime")
(autoload 'mime-entity-body-start-point "mime")
(autoload 'mime-entity-body-end-point "mime")


;;; @ lexical analyzer
;;;

(unless-broken ccl-usable
(define-ccl-program mime-default-ccl-lexical-analyzer
  ;; r0 input
  ;; r1 flag means any character exists.
  ;; r2 in parse flag
  ;;    1 atom, 2 spaces 3 comment (no output) 4 encloser 5 error
  ;; r3 comment depth
  (eval-when-compile
    (let* ((wrt `(if (r0 == ?\") (write "\\\"")
		   (if (r0 == ?\\) (write "\\\\")
		     (write r0))))
	   (atm `((branch r2
			  ((r2 = 1)
			   (write "(mime-token . \"")
			   (write-read-repeat r0))
			  (write-read-repeat r0)
			  ((r2 = 1)
			   (write "(mime-token . \"")
			   (write-read-repeat r0)))
		  ))
	   (ts  `((if (r2 == 1) ((write "\")") (r2 = 0)))
		  (write "(tspecials . \"")
		  ,wrt
		  (write "\")")
		  (read r0)
		  (repeat)))
	   (sp  `((branch r2
			  ((r2 = 2)
			   (read r0)
			   (repeat))
			  ((write "\")")
			   (r2 = 2)
			   (read r0)
			   (repeat))
			  ((read r0) (repeat)))
		  ))
	   (err `((branch r2
			  ((write "(error . \""))
			  ((write "\")")
			   (write "(error . \""))
			  ((write "(error . \"")))
		  (r2 = 5)
		  (loop
		   (write-read-repeat r0))))
	   (enc (lambda (name tag)
		  `((if (r2 == 1) ((write "\")")))
		    (write ,(concat "(" name " . \""))
		    (r2 = 4)
		    (loop
		     (read-branch
		      r0
		      ,@(let* ((count (1+ (max tag ?\\)))
			       (result (make-vector count '(write-repeat r0))))
			  (aset result tag '(break))
			  (aset result ?\\ `((write "\\\\")
					     (read r0)
					     ,wrt
					     (repeat)))
			  (aset result ?\" '((write "\\\"") (repeat)))
			  (mapcar 'identity result)))
		     (write-repeat r0))
		    (write "\")")
		    (r2 = 0)
		    (read r0)
		    (repeat))))
	   (qs (funcall enc "quoted-string" ?\"))
	   (dl (funcall enc "domain-literal" ?\]))
	   (cm  `((if (r2 == 1) ((write "\")")))
		  (r2 = 3)
		  (r3 = 1)
		  (loop
		   (read-branch
		    r0
		    ,@(let* ((count (1+ (max ?\( ?\) ?\\)))
			     (result (make-vector count '(repeat))))
			(aset result ?\( '((r3 += 1) (repeat)))
			(aset result ?\) '((r3 -= 1)
					   (if (r3 < 1) (break)
					     (repeat))))
			(aset result ?\\ `((read r0) (repeat)))
			(mapcar 'identity result)))
		   (repeat))
		  (r2 = 0)
		  (read r0)
		  (repeat))))
      `(8
	((r2 = 0)
	 (read r0)
	 (r1 = 1)
	 (write "((")
	 (loop
	  (branch r0
		  ,@(mapcar (lambda (elt) (eval elt))
			    '(err err err err err err err err
				  err sp  sp  err err err err err
				  err err err err err err err err
				  err err err err err err err err
				  sp  atm qs  atm atm atm atm atm
				  cm  ts  atm atm ts  atm atm ts 
				  atm atm atm atm atm atm atm atm
				  atm atm ts  ts  ts  ts  ts  ts
				  ts  atm atm atm atm atm atm atm
				  atm atm atm atm atm atm atm atm
				  atm atm atm atm atm atm atm atm
				  atm atm atm dl  ts  ts)))
	  ,@atm))
	((branch r1
		 (write "(nil . t)")
		 (branch r2
			 (write ") . t)")
			 (write "\")) . t)")
			 (write ") . t)")
			 (write "))")
			 (write "\")))")
			 (write "\")) . t)"))
		 ))
	))))
)

(defcustom mime-ccl-lexical-analyzer
  (static-unless (or (broken-p 'ccl-usable)
		     (broken-p 'ccl-execute-eof-block))
    'mime-default-ccl-lexical-analyzer)
  "Specify CCL-program symbol for `mime-lexical-analyze'.
When nil, do not use CCL.
See docstring of `std11-ccl-lexical-analyzer' for details of CCL-program.
If you modify `mime-lexical-analyzer', set this variable to nil or prepare corresponding CCL-program."
  :group 'mime
  :type '(choice symbol (const :tag "Do not use CCL." nil)))

(defcustom mime-lexical-analyzer
  '(std11-analyze-quoted-string
    std11-analyze-domain-literal
    std11-analyze-comment
    std11-analyze-spaces
    mime-analyze-tspecial
    mime-analyze-token)
  "*List of functions to return result of lexical analyze.
Each function must have two arguments: STRING and START.
STRING is the target string to be analyzed.
START is start position of STRING to analyze.

Previous function is preferred to next function.  If a function
returns nil, next function is used.  Otherwise the return value will
be the result."
  :group 'mime
  :type '(repeat function))

(defun mime-analyze-tspecial (string start)
  (if (and (> (length string) start)
	   (memq (aref string start) mime-tspecial-char-list))
      (cons (cons 'tspecials (substring string start (1+ start)))
	    (1+ start))))

(defun mime-analyze-token (string start)
  (if (and (string-match mime-token-regexp string start)
	   (= (match-beginning 0) start))
      (let ((end (match-end 0)))
	(cons (cons 'mime-token (substring string start end))
	      end))))

(defun mime-lexical-analyze (string)
  "Analyze STRING as lexical tokens of MIME."
  (let (ret prev tail)
    (if (and mime-ccl-lexical-analyzer
	     (cdr (setq ret (read (ccl-execute-on-string
				   mime-ccl-lexical-analyzer
				   (make-vector 9 0) (or string ""))))))
	(car ret)
      (setq ret (std11-lexical-analyze string mime-lexical-analyzer))
      ;; skip leading linear-white-space.
      (while (memq (car (car ret)) '(spaces comment))
	(setq ret (cdr ret)))
      (setq prev ret
	    tail (cdr ret))
      ;; remove linear-white-space.
      (while tail
	(if (memq (car (car tail)) '(spaces comment))
	    (progn
	      (setcdr prev (cdr tail))
	      (setq tail (cdr tail)))
	  (setq prev (cdr prev)
		tail (cdr tail))))
      ret)))


;;; @ field parser
;;;

(defun mime-decode-parameter-value (text charset language)
  (with-temp-buffer
    (set-buffer-multibyte nil)
    (insert text)
    (goto-char (point-min))
    (while (re-search-forward "%[0-9A-Fa-f][0-9A-Fa-f]" nil t)
      (insert (prog1 (string-to-number
		      (buffer-substring (point)(- (point) 2))
		      16)
                (delete-region (point)(- (point) 3)))))
    (setq text (buffer-string))
    (when charset
      (setq text (mime-charset-decode-string text charset)))
    (when language
      (put-text-property 0 (length text) 'mime-language language text))
    text))

(defun mime-decode-parameter-encode-segment (segment)
  (with-temp-buffer
    (set-buffer-multibyte nil)
    (insert segment)
    (goto-char (point-min))
    (while (progn
             (when (looking-at (eval-when-compile
                                 (concat mime-attribute-char-regexp "+")))
               (goto-char (match-end 0)))
             (not (eobp)))
      (insert (prog1 (format "%%%02X" (char-int (char-after)))
                (delete-region (point)(1+ (point))))))
    (buffer-string)))

(defun mime-decode-parameters (params)
  "Decode PARAMS as a property list of MIME parameter values.
Return value is an association list of MIME parameter values.
If parameter continuation is used, segments of values are concatenated.
If parameters contain charset information, values are decoded.
If parameters contain language information, it is set to `mime-language'
property of the decoded-value."
  ;; (unless (zerop (% (length params) 2)) ...)
  (let ((len (/ (length params) 2))
        dest eparams)
    (while params
      (if (and (string-match (eval-when-compile
			       (concat "^\\(" mime-attribute-char-regexp "+\\)"
				       "\\(\\*[0-9]+\\)?" ; continuation
				       "\\(\\*\\)?$")) ; charset/language
			     (car params))
	       (> (match-end 0) (match-end 1)))
	  ;; parameter value extensions are used.
          (let* ((attribute (downcase
			     (substring (car params) 0 (match-end 1))))
                 (section (if (match-beginning 2)
			      (string-to-number
			       (substring (car params)
					  (1+ (match-beginning 2))
					  (match-end 2)))
			    0))
		 ;; EPARAM := (ATTRIBUTE VALUES CHARSET LANGUAGE)
		 ;; VALUES := [1*VALUE] ; vector of LEN elements.
                 (eparam (assoc attribute eparams))
		 (value (progn
			  (setq params (cdr params))
			  (car params))))
            (if eparam
		(setq eparam (cdr eparam))
              (setq eparam (list (make-vector len nil) nil nil)
                    eparams (cons (cons attribute eparam) eparams)))
	    ;; if parameter-name ends with "*", it is an extended-parameter.
            (if (match-beginning 3)
                (if (zerop section)
		    ;; extended-initial-parameter.
		    (if (string-match (eval-when-compile
					(concat
					 "^\\(" mime-charset-regexp "\\)?"
					 "'\\(" mime-language-regexp "\\)?"
					 "'\\(\\(" mime-attribute-char-regexp
					 "\\|%[0-9A-Fa-f][0-9A-Fa-f]\\)+\\)$"))
				      value)
			(progn
			  ;; text
			  (aset (car eparam) 0
				(substring value (match-beginning 3)))
			  (setq eparam (cdr eparam))
			  ;; charset
			  (when (match-beginning 1)
			    (setcar eparam
				    (downcase
				     (substring value 0 (match-end 1)))))
			  (setq eparam (cdr eparam))
			  ;; language
			  (when (match-beginning 2)
			    (setcar eparam
				    (intern
				     (downcase
				      (substring value
						 (match-beginning 2)
						 (match-end 2)))))))
		      ;; invalid parameter-value.
		      (aset (car eparam) 0
			    (mime-decode-parameter-encode-segment value)))
		  ;; extended-other-parameter.
		  (if (string-match (eval-when-compile
				      (concat
				       "^\\(\\(" mime-attribute-char-regexp
				       "\\|%[0-9A-Fa-f][0-9A-Fa-f]\\)+\\)$"))
				    value)
		      (aset (car eparam) section value)
		    ;; invalid parameter-value.
		    (aset (car eparam) section
			  (mime-decode-parameter-encode-segment value))))
	      ;; regular-parameter. parameter continuation only.
              (aset (car eparam) section
		    (mime-decode-parameter-encode-segment value))))
	;; parameter value extensions are not used,
	;; or invalid attribute-name (in RFC2231, although valid in RFC2045).
        (setq dest (cons (cons (downcase (car params))
;;;			       ;; decode (invalid!) encoded-words.
;;; 			       (eword-decode-string
;;; 				(decode-mime-charset-string
;;; 				 (car (cdr params))
;;; 				 default-mime-charset)
;;; 				'must-unfold)
			       (car (cdr params)))
			 dest)
	      params (cdr params)))
      (setq params (cdr params)))
    ;; concat and decode parameters.
    (while eparams
      (setq dest (cons (cons (car (car eparams)) ; attribute
			     (mime-decode-parameter-value
			      (mapconcat (function identity)
					 (nth 1 (car eparams)) ; values
					 "")
			      (nth 2 (car eparams)) ; charset
			      (nth 3 (car eparams)) ; language
			      ))
		       dest)
	    eparams (cdr eparams)))
    dest))

;;; for compatibility with flim-1_13-rfc2231 API.
(defalias 'mime-parse-parameters-from-list 'mime-decode-parameters)
(make-obsolete 'mime-parse-parameters-from-list 'mime-decode-parameters)


;;; @ parameter value encoder
;;;

(defun mime-divide-extended-parameter (name value)
  "Divide MIME parameter value \"NAME=VALUE\" into segments.
Each of \" NAME*n*=SEGMENT_n\;\" will be no more than 78 characters.
Return value is a list of string when division is performed, otherwise
return value is just a string."
  ;; `limit' must be more than (length "CHARSET'LANGUAGE'%XX").
  ;;
  ;; Since MIME spec does not limit either length of CHARSET or length
  ;; of LANGUAGE, we choose 30 for minimum `limit' based on the longest
  ;; name of charset that Emacs supports ("ISO-2022-CN-EXT"; 15 chars).
  ;;
  ;; Anyway, if `name' is too long, we will ignore 78 chars limit.
  (let ((limit (max (- 78 4 (length name)) 30))); (length " *=;") => 4
    (if (> limit (length value))
	value
      (let ((count 0)
	    result)
	(setq limit (max (- limit 2) 30))	; (length "*n") => 2
	(with-temp-buffer
	  (set-buffer-multibyte nil)
	  (insert value)
	  (while (> (point-max) limit)
	    (goto-char (- limit 3))		; (length "%XX") => 3
	    (cond
	     ((eq (char-after) ?%)
	      (forward-char 3))
	     ((progn
		(forward-char)
		(eq (char-after) ?%)))
	     ((progn
		(forward-char)
		(eq (char-after) ?%)))
	     (t
	      (forward-char)))
	    (setq result (cons (prog1 (buffer-substring (point-min)(point))
				 (delete-region (point-min)(point)))
			       result)
		  count (1+ count))
	    (when (zerop (% count 10))
	      (setq limit (max (1- limit) 30))))
	  (nreverse
	   (cons (buffer-substring (point-min)(point-max))
		 result)))))))

(defun mime-encode-extended-parameter (name value)
  "Encode MIME parameter value \"NAME=VALUE\" as an extended-parameter.
If encoding is unnecessary, return nil.
If division is performed, return value is a list of string, otherwise
return value is just a string."
  (let ((language (get-text-property 0 'mime-language value)))
    (when (or language
	      (string-match "[^ -~]" value)) ; Nonmatching printable US-ASCII.
      (with-temp-buffer
	(let ((charset (find-mime-charset-by-charsets
			(find-charset-string value))))
	  (setq value (mime-charset-encode-string value charset))
	  (set-buffer-multibyte nil)
	  (insert value)
	  (goto-char (point-min))
	  (insert (symbol-name charset)
		  ?'
		  (if language (symbol-name language) "")
		  ?')
	  (while (re-search-forward mime-non-attribute-char-regexp nil t)
	    (insert (prog1 (format "%%%02X" (char-int
					     (char-after (1- (point)))))
		      (delete-region (1- (point))(point)))))
	  (mime-divide-extended-parameter name (buffer-string)))))))

(defun mime-divide-regular-parameter (name value)
  "Divide MIME parameter value \"NAME=VALUE\" into segments.
Each of \" NAME*n=SEGMENT_n\;\" will be no more than 78 characters.
Return value is a list of string when division is performed, otherwise
just a string is returned."
  (let ((limit (max (- (eval-when-compile (- 78 (length " =\"\";")))
		       (length name))
		    30)))
    (if (> limit (length value))
	(concat "\"" value "\"")
      (let ((count 0)
	    result)
	(setq limit (max (- limit 2) 30))	; (length "*n") => 2
	(setq limit (1- limit))			; XXX
	(with-temp-buffer
	  (set-buffer-multibyte nil)
	  (insert value)
	  (while (> (point-max) limit)
	    (goto-char (point-min))
	    (while (< (point) limit)
	      (when (eq (char-after) ?\\)
		(forward-char))
	      (forward-char))
	    (setq result (cons (concat "\""
				       (prog1 (buffer-substring
					       (point-min)(point))
					 (delete-region
					  (point-min)(point)))
				       "\"")
			       result)
		  count (1+ count))
	    (when (zerop (% count 10))
	      (setq limit (max (1- limit) 30))))
	  (nreverse
	   (cons (concat "\""
			 (buffer-substring (point-min)(point-max))
			 "\"")
		 result)))))))

(defun mime-encode-regular-parameter (name value)
  "Encode MIME parameter value \"NAME=VALUE\" as a regular-parameter.
If division is performed, return value is a list of string, otherwise
return value is just a string."
  (with-temp-buffer
    (set-buffer-multibyte nil)
    (insert value)
    (goto-char (point-min))
    (while (not (eobp))
      (when (memq (char-after) '(?\\ ?\"))
	(insert ?\\))
      (forward-char 1))
    (mime-divide-regular-parameter name (buffer-string))))

(defun mime-encode-parameters (params)
  "Encode PARAMS plist with MIME Parameter-Value Extensions.
Return value is an alist of MIME parameter values."
  (let (name value encoded result)
    (while params
      (setq name (car params)
            value (car (cdr params))
            params (cdr (cdr params)))
      (cond
       ;; first two clauses are for backward compatibility,
       ;; especially for "ftp.in" in the distribution.
       ((not (string-match (eval-when-compile
			     (concat "^\\(" mime-attribute-char-regexp "+\\)"
				     "\\(\\*[0-9]+\\)?" ; continuation
				     "\\(\\*\\)?$")) ; charset/language
			   name))
	;; invalid parameter name.
	;; XXX: Should we signal an error?
	)
       ((> (match-end 0) (match-end 1))
	;; this parameter value is already encoded.
	(setq result (cons (cons name
				 (if (match-beginning 3)
				     ;; extended-parameter
				     value
				   ;; regular-parameter
				   (std11-wrap-as-quoted-string value)))
			   result)))
       ((setq encoded (mime-encode-extended-parameter name value))
	;; extended-parameter
	(if (stringp encoded)
	    (setq result (cons (cons (concat name "*") encoded) result))
	  ;; with continuation
	  (let ((section 0))
	    (while encoded
	      (setq result (cons (cons (concat name
					       "*" (int-to-string section)
					       "*")
				       (car encoded))
				 result)
		    section (1+ section)
		    encoded(cdr encoded))))))
       (t
	;; regular-parameter
	(setq encoded (mime-encode-regular-parameter name value))
        (if (stringp encoded)
            (setq result (cons (cons name encoded) result))
	  ;; with continuation
          (let ((section 0))
            (while encoded
              (setq result (cons (cons (concat name
                                               "*" (int-to-string section))
				       (car encoded))
				 result)
		    section (1+ section)
		    encoded (cdr encoded))))))))
    (nreverse result)))

(defun mime-encode-parameters-broken-mime (params)
  "Encode PARAMS plist compatibly with Outlook.
Return value is an alist of MIME parameter values."
  (let (result)
    (while (cadr params)
      (setq result
	    `((,(car params)
	       . ,(eword-encode-string (cadr params)
				       (+ (length (car params)) 3)))
	      . ,result)
	    params (cddr params)))
    (nreverse result)))


;;; @ field parser
;;;

(defun mime-parse-parameters (tokens)
  "Parse TOKENS as MIME parameter values.
Return a property list, which is a list of the form
\(PARAMETER-NAME1 VALUE1 PARAMETER-NAME2 VALUE2...)."
  (let (params attribute)
    (while (and tokens
		(eq (car (car tokens)) 'tspecials)
		(string= (cdr (car tokens)) ";")
		(setq tokens (cdr tokens))
		(eq (car (car tokens)) 'mime-token)
		(progn
		  (setq attribute (cdr (car tokens)))
		  (setq tokens (cdr tokens)))
		(eq (car (car tokens)) 'tspecials)
		(string= (cdr (car tokens)) "=")
		(setq tokens (cdr tokens))
		(memq (car (car tokens)) '(mime-token quoted-string)))
      (setq params (cons (if (eq (car (car tokens)) 'quoted-string)
			     (std11-strip-quoted-pair (cdr (car tokens)))
			   (cdr (car tokens)))
			 (cons attribute params))
	    tokens (cdr tokens)))
    (nreverse params)))


;;; @@ Content-Type
;;;

;;;###autoload
(defun mime-parse-Content-Type (field-body)
  "Parse FIELD-BODY as a Content-Type field.
FIELD-BODY is a string.
Return value is a mime-content-type object.
If FIELD-BODY is not a valid Content-Type field, return nil."
  (let ((tokens (mime-lexical-analyze field-body)))
    (when (eq (car (car tokens)) 'mime-token)
      (let ((primary-type (cdr (car tokens))))
	(setq tokens (cdr tokens))
	(when (and (eq (car (car tokens)) 'tspecials)
		   (string= (cdr (car tokens)) "/")
		   (setq tokens (cdr tokens))
		   (eq (car (car tokens)) 'mime-token))
	  (make-mime-content-type
	   (intern (downcase primary-type))
	   (intern (downcase (cdr (car tokens))))
	   (mime-decode-parameters
	    (mime-parse-parameters (cdr tokens)))))))))

;;;###autoload
(defun mime-read-Content-Type ()
  "Parse field-body of Content-Type field of current-buffer.
Return value is a mime-content-type object.
If Content-Type field is not found, return nil."
  (let ((field-body (std11-field-body "Content-Type")))
    (if field-body
	(mime-parse-Content-Type field-body)
      )))


;;; @@ Content-Disposition
;;;

;;;###autoload
(defun mime-parse-Content-Disposition (field-body)
  "Parse FIELD-BODY as a Content-Disposition field.
FIELD-BODY is a string.
Return value is a mime-content-disposition object.
If FIELD-BODY is not a valid Content-Disposition field, return nil."
  (let ((tokens (mime-lexical-analyze field-body)))
    (when (eq (car (car tokens)) 'mime-token)
      (make-mime-content-disposition
       (intern (downcase (cdr (car tokens))))
       (mime-decode-parameters
	(mime-parse-parameters (cdr tokens)))))))

;;;###autoload
(defun mime-read-Content-Disposition ()
  "Parse field-body of Content-Disposition field of current-buffer.
Return value is a mime-content-disposition object.
If Content-Disposition field is not found, return nil."
  (let ((field-body (std11-field-body "Content-Disposition")))
    (if field-body
	(mime-parse-Content-Disposition field-body)
      )))


;;; @@ Content-Transfer-Encoding
;;;

;;;###autoload
(defun mime-parse-Content-Transfer-Encoding (field-body)
  "Parse FIELD-BODY as a Content-Transfer-Encoding field.
FIELD-BODY is a string.
Return value is a string.
If FIELD-BODY is not a valid Content-Transfer-Encoding field, return nil."
  (let ((tokens (mime-lexical-analyze field-body)))
    (when (eq (car (car tokens)) 'mime-token)
      (downcase (cdr (car tokens))))))

;;;###autoload
(defun mime-read-Content-Transfer-Encoding ()
  "Parse field-body of Content-Transfer-Encoding field of current-buffer.
Return value is a string.
If Content-Transfer-Encoding field is not found, return nil."
  (let ((field-body (std11-field-body "Content-Transfer-Encoding")))
    (if field-body
	(mime-parse-Content-Transfer-Encoding field-body)
      )))


;;; @@ Content-ID / Message-ID
;;;

;;;###autoload
(defun mime-parse-msg-id (tokens)
  "Parse TOKENS as msg-id of Content-ID or Message-ID field."
  (car (std11-parse-msg-id tokens)))

;;;###autoload
(defun mime-uri-parse-cid (string)
  "Parse STRING as cid URI."
  (when (string-match "^cid:" string)
    (setq string (concat "<" (substring string 4) ">"))
    (let ((parser (cdr (assq 'Content-Id mime-field-parser-alist))))
      (if parser
	  (funcall parser (eword-lexical-analyze string))
	(mime-decode-field-body string 'Content-Id 'plain)))))



;;; @ message parser
;;;

;; (defun mime-parse-multipart (entity)
;;   (with-current-buffer (mime-entity-body-buffer entity)
;;     (let* ((representation-type
;;             (mime-entity-representation-type-internal entity))
;;            (content-type (mime-entity-content-type-internal entity))
;;            (dash-boundary
;;             (concat "--"
;;                     (mime-content-type-parameter content-type "boundary")))
;;            (delimiter       (concat "\n" (regexp-quote dash-boundary)))
;;            (close-delimiter (concat delimiter "--[ \t]*$"))
;;            (rsep (concat delimiter "[ \t]*\n"))
;;            (dc-ctl
;;             (if (eq (mime-content-type-subtype content-type) 'digest)
;;                 (make-mime-content-type 'message 'rfc822)
;;               (make-mime-content-type 'text 'plain)
;;               ))
;;            (body-start (mime-entity-body-start-point entity))
;;            (body-end (mime-entity-body-end-point entity)))
;;       (save-restriction
;;         (goto-char body-end)
;;         (narrow-to-region body-start
;;                           (if (re-search-backward close-delimiter nil t)
;;                               (match-beginning 0)
;;                             body-end))
;;         (goto-char body-start)
;;         (if (re-search-forward
;;              (concat "^" (regexp-quote dash-boundary) "[ \t]*\n")
;;              nil t)
;;             (let ((cb (match-end 0))
;;                   ce ncb ret children
;;                   (node-id (mime-entity-node-id-internal entity))
;;                   (i 0))
;;               (while (re-search-forward rsep nil t)
;;                 (setq ce (match-beginning 0))
;;                 (setq ncb (match-end 0))
;;                 (save-restriction
;;                   (narrow-to-region cb ce)
;;                   (setq ret (mime-parse-message representation-type dc-ctl
;;                                                 entity (cons i node-id)))
;;                   )
;;                 (setq children (cons ret children))
;;                 (goto-char (setq cb ncb))
;;                 (setq i (1+ i))
;;                 )
;;               (setq ce (point-max))
;;               (save-restriction
;;                 (narrow-to-region cb ce)
;;                 (setq ret (mime-parse-message representation-type dc-ctl
;;                                               entity (cons i node-id)))
;;                 )
;;               (setq children (cons ret children))
;;               (mime-entity-set-children-internal entity (nreverse children))
;;               )
;;           (mime-entity-set-content-type-internal
;;            entity (make-mime-content-type 'message 'x-broken))
;;           nil)
;;         ))))

;; (defun mime-parse-encapsulated (entity)
;;   (mime-entity-set-children-internal
;;    entity
;;    (with-current-buffer (mime-entity-body-buffer entity)
;;      (save-restriction
;;        (narrow-to-region (mime-entity-body-start-point entity)
;;                          (mime-entity-body-end-point entity))
;;        (list (mime-parse-message
;;               (mime-entity-representation-type-internal entity) nil
;;               entity (cons 0 (mime-entity-node-id-internal entity))))
;;        ))))

;; (defun mime-parse-external (entity)
;;   (require 'mmexternal)
;;   (mime-entity-set-children-internal
;;    entity
;;    (with-current-buffer (mime-entity-body-buffer entity)
;;      (save-restriction
;;        (narrow-to-region (mime-entity-body-start-point entity)
;;                          (mime-entity-body-end-point entity))
;;        (list (mime-parse-message
;;               'mime-external-entity nil
;;               entity (cons 0 (mime-entity-node-id-internal entity))))
;;        ;; [tomo] Should we unify with `mime-parse-encapsulated'?
;;        ))))

(defun mime-parse-message (representation-type &optional default-ctl 
					       parent node-id)
  (let ((header-start (point-min))
	header-end
	body-start
	(body-end (point-max))
	content-type)
    (goto-char header-start)
    (if (re-search-forward "^$" nil t)
	(setq header-end (match-end 0)
	      body-start (if (= header-end body-end)
			     body-end
			   (1+ header-end)))
      (setq header-end (point-min)
	    body-start (point-min)))
    (save-restriction
      (narrow-to-region header-start header-end)
      (setq content-type (or (mime-read-Content-Type)
			     default-ctl))
      )
    (luna-make-entity representation-type
		      :location (current-buffer)
		      :content-type content-type
		      :parent parent
		      :node-id node-id
		      :buffer (current-buffer)
		      :header-start header-start
		      :header-end header-end
		      :body-start body-start
		      :body-end body-end)
    ))


;;; @ for buffer
;;;

;;;###autoload
(defun mime-parse-buffer (&optional buffer representation-type)
  "Parse BUFFER as a MIME message.
If buffer is omitted, it parses current-buffer."
  (require 'mmbuffer)
  (save-excursion
    (if buffer (set-buffer buffer))
    (mime-parse-message (or representation-type
			    'mime-buffer-entity) nil)))


;;; @ end
;;;

(provide 'mime-parse)

;;; mime-parse.el ends here
