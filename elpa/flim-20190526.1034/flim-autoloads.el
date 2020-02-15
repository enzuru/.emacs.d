;;; flim-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "eword-decode" "eword-decode.el" (0 0 0 0))
;;; Generated autoloads from eword-decode.el

(autoload 'mime-set-field-decoder "eword-decode" "\
Set decoder of FIELD.
SPECS must be like `MODE1 DECODER1 MODE2 DECODER2 ...'.
Each mode must be `nil', `plain', `wide', `summary' or `nov'.
If mode is `nil', corresponding decoder is set up for every modes.

\(fn FIELD &rest SPECS)" nil nil)

(autoload 'mime-find-field-presentation-method "eword-decode" "\
Return field-presentation-method from NAME.
NAME must be `plain', `wide', `summary' or `nov'.

\(fn NAME)" nil t)

(autoload 'mime-find-field-decoder "eword-decode" "\
Return function to decode field-body of FIELD in MODE.
Optional argument MODE must be object or name of
field-presentation-method.  Name of field-presentation-method must be
`plain', `wide', `summary' or `nov'.
Default value of MODE is `summary'.

\(fn FIELD &optional MODE)" nil nil)

(autoload 'mime-update-field-decoder-cache "eword-decode" "\
Update field decoder cache `mime-field-decoder-cache'.

\(fn FIELD MODE &optional FUNCTION)" nil nil)

(autoload 'mime-decode-field-body "eword-decode" "\
Decode FIELD-BODY as FIELD-NAME in MODE, and return the result.
Optional argument MODE must be `plain', `wide', `summary' or `nov'.
Default mode is `summary'.

If MODE is `wide' and MAX-COLUMN is non-nil, the result is folded with
MAX-COLUMN.

Non MIME encoded-word part in FILED-BODY is decoded with
`default-mime-charset'.

\(fn FIELD-BODY FIELD-NAME &optional MODE MAX-COLUMN)" nil nil)

(autoload 'mime-decode-header-in-region "eword-decode" "\
Decode MIME encoded-words in region between START and END.
If CODE-CONVERSION is nil, it decodes only encoded-words.  If it is
mime-charset, it decodes non-ASCII bit patterns as the mime-charset.
Otherwise it decodes non-ASCII bit patterns as the
default-mime-charset.

\(fn START END &optional CODE-CONVERSION)" t nil)

(autoload 'mime-decode-header-in-buffer "eword-decode" "\
Decode MIME encoded-words in header fields.
If CODE-CONVERSION is nil, it decodes only encoded-words.  If it is
mime-charset, it decodes non-ASCII bit patterns as the mime-charset.
Otherwise it decodes non-ASCII bit patterns as the
default-mime-charset.
If SEPARATOR is not nil, it is used as header separator.

\(fn &optional CODE-CONVERSION SEPARATOR)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eword-decode" '("eword-" "mime-")))

;;;***

;;;### (autoloads nil "eword-encode" "eword-encode.el" (0 0 0 0))
;;; Generated autoloads from eword-encode.el

(autoload 'mime-encode-field-body "eword-encode" "\
Encode FIELD-BODY as FIELD-NAME, and return the result.
A lexical token includes non-ASCII character is encoded as MIME
encoded-word.  ASCII token is not encoded.

\(fn FIELD-BODY FIELD-NAME)" nil nil)

(autoload 'mime-encode-header-in-buffer "eword-encode" "\
Encode header fields to network representation, such as MIME encoded-word.
It refers the `mime-field-encoding-method-alist' variable.

\(fn &optional CODE-CONVERSION)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eword-encode" '("ew-" "eword-" "tm-eword::encoded-word-length" "mime-header-" "make-ew-rword")))

;;;***

;;;### (autoloads nil "hex-util" "hex-util.el" (0 0 0 0))
;;; Generated autoloads from hex-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hex-util" '("encode-hex-string" "decode-hex-string")))

;;;***

;;;### (autoloads nil "hmac-def" "hmac-def.el" (0 0 0 0))
;;; Generated autoloads from hmac-def.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hmac-def" '("define-hmac-function")))

;;;***

;;;### (autoloads nil "hmac-md5" "hmac-md5.el" (0 0 0 0))
;;; Generated autoloads from hmac-md5.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hmac-md5" '("hmac-md5")))

;;;***

;;;### (autoloads nil "hmac-sha1" "hmac-sha1.el" (0 0 0 0))
;;; Generated autoloads from hmac-sha1.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hmac-sha1" '("hmac-sha1")))

;;;***

;;;### (autoloads nil "luna" "luna.el" (0 0 0 0))
;;; Generated autoloads from luna.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "luna" '("luna-")))

;;;***

;;;### (autoloads nil "lunit" "lunit.el" (0 0 0 0))
;;; Generated autoloads from lunit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lunit" '("lunit")))

;;;***

;;;### (autoloads nil "md4" "md4.el" (0 0 0 0))
;;; Generated autoloads from md4.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "md4" '("md4")))

;;;***

;;;### (autoloads nil "md5" "md5.el" (0 0 0 0))
;;; Generated autoloads from md5.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "md5" '("md5-dl-module")))

;;;***

;;;### (autoloads nil "mel" "mel.el" (0 0 0 0))
;;; Generated autoloads from mel.el

(autoload 'mime-encode-region "mel" "\
Encode region START to END of current buffer using ENCODING.
ENCODING must be string.

\(fn START END ENCODING)" t nil)

(autoload 'mime-decode-region "mel" "\
Decode region START to END of current buffer using ENCODING.
ENCODING must be string.

\(fn START END ENCODING)" t nil)

(autoload 'mime-decode-string "mel" "\
Decode STRING using ENCODING.
ENCODING must be string.  If ENCODING is found in
`mime-string-decoding-method-alist' as its key, this function decodes
the STRING by its value.

\(fn STRING ENCODING)" nil nil)

(autoload 'mime-insert-encoded-file "mel" "\
Insert file FILENAME encoded by ENCODING format.

\(fn FILENAME ENCODING)" t nil)

(autoload 'mime-write-decoded-region "mel" "\
Decode and write current region encoded by ENCODING into FILENAME.
START and END are buffer positions.

\(fn START END FILENAME ENCODING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel" '("Q-encod" "binary-" "base64-encoded-length" "encoded-text-encode-string" "mime-encoding-" "mel-" "7bit-" "8bit-")))

;;;***

;;;### (autoloads nil "mel-b-ccl" "mel-b-ccl.el" (0 0 0 0))
;;; Generated autoloads from mel-b-ccl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-b-ccl" '("base64-" "mel-ccl-encode-b")))

;;;***

;;;### (autoloads nil "mel-b-el" "mel-b-el.el" (0 0 0 0))
;;; Generated autoloads from mel-b-el.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-b-el" '("base64-" "pack-sequence")))

;;;***

;;;### (autoloads nil "mel-g" "mel-g.el" (0 0 0 0))
;;; Generated autoloads from mel-g.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-g" '("gzip64-external-")))

;;;***

;;;### (autoloads nil "mel-q" "mel-q.el" (0 0 0 0))
;;; Generated autoloads from mel-q.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-q" '("quoted-printable-" "q-encoding-")))

;;;***

;;;### (autoloads nil "mel-q-ccl" "mel-q-ccl.el" (0 0 0 0))
;;; Generated autoloads from mel-q-ccl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-q-ccl" '("mel-ccl-")))

;;;***

;;;### (autoloads nil "mel-u" "mel-u.el" (0 0 0 0))
;;; Generated autoloads from mel-u.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mel-u" '("uuencode-external-")))

;;;***

;;;### (autoloads nil "mime" "mime.el" (0 0 0 0))
;;; Generated autoloads from mime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime" '("mime-")))

;;;***

;;;### (autoloads nil "mime-conf" "mime-conf.el" (0 0 0 0))
;;; Generated autoloads from mime-conf.el

(autoload 'mime-parse-mailcap-buffer "mime-conf" "\
Parse BUFFER as a mailcap, and return the result.
If optional argument ORDER is a function, result is sorted by it.
If optional argument ORDER is not specified, result is sorted original
order.  Otherwise result is not sorted.

\(fn &optional BUFFER ORDER)" nil nil)

(defvar mime-mailcap-file "~/.mailcap" "\
*File name of user's mailcap file.")

(autoload 'mime-parse-mailcap-file "mime-conf" "\
Parse FILENAME as a mailcap, and return the result.
If optional argument ORDER is a function, result is sorted by it.
If optional argument ORDER is not specified, result is sorted original
order.  Otherwise result is not sorted.

\(fn &optional FILENAME ORDER)" nil nil)

(autoload 'mime-format-mailcap-command "mime-conf" "\
Return formated command string from MTEXT and SITUATION.

MTEXT is a command text of mailcap specification, such as
view-command.

SITUATION is an association-list about information of entity.  Its key
may be:

	'type		primary media-type
	'subtype	media-subtype
	'filename	filename
	STRING		parameter of Content-Type field

\(fn MTEXT SITUATION)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-conf" '("mime-mailcap-")))

;;;***

;;;### (autoloads nil "mime-def" "mime-def.el" (0 0 0 0))
;;; Generated autoloads from mime-def.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-def" '("base64-" "make-mime-content-" "mime-" "mel-" "Q-encoded-text-regexp" "quoted-printable-" "B-encoded-text-regexp" "regexp-")))

;;;***

;;;### (autoloads nil "mime-parse" "mime-parse.el" (0 0 0 0))
;;; Generated autoloads from mime-parse.el

(autoload 'mime-parse-Content-Type "mime-parse" "\
Parse FIELD-BODY as a Content-Type field.
FIELD-BODY is a string.
Return value is a mime-content-type object.
If FIELD-BODY is not a valid Content-Type field, return nil.

\(fn FIELD-BODY)" nil nil)

(autoload 'mime-read-Content-Type "mime-parse" "\
Parse field-body of Content-Type field of current-buffer.
Return value is a mime-content-type object.
If Content-Type field is not found, return nil.

\(fn)" nil nil)

(autoload 'mime-parse-Content-Disposition "mime-parse" "\
Parse FIELD-BODY as a Content-Disposition field.
FIELD-BODY is a string.
Return value is a mime-content-disposition object.
If FIELD-BODY is not a valid Content-Disposition field, return nil.

\(fn FIELD-BODY)" nil nil)

(autoload 'mime-read-Content-Disposition "mime-parse" "\
Parse field-body of Content-Disposition field of current-buffer.
Return value is a mime-content-disposition object.
If Content-Disposition field is not found, return nil.

\(fn)" nil nil)

(autoload 'mime-parse-Content-Transfer-Encoding "mime-parse" "\
Parse FIELD-BODY as a Content-Transfer-Encoding field.
FIELD-BODY is a string.
Return value is a string.
If FIELD-BODY is not a valid Content-Transfer-Encoding field, return nil.

\(fn FIELD-BODY)" nil nil)

(autoload 'mime-read-Content-Transfer-Encoding "mime-parse" "\
Parse field-body of Content-Transfer-Encoding field of current-buffer.
Return value is a string.
If Content-Transfer-Encoding field is not found, return nil.

\(fn)" nil nil)

(autoload 'mime-parse-msg-id "mime-parse" "\
Parse TOKENS as msg-id of Content-ID or Message-ID field.

\(fn TOKENS)" nil nil)

(autoload 'mime-uri-parse-cid "mime-parse" "\
Parse STRING as cid URI.

\(fn STRING)" nil nil)

(autoload 'mime-parse-buffer "mime-parse" "\
Parse BUFFER as a MIME message.
If buffer is omitted, it parses current-buffer.

\(fn &optional BUFFER REPRESENTATION-TYPE)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-parse" '("mime-")))

;;;***

;;;### (autoloads nil "mmbuffer" "mmbuffer.el" (0 0 0 0))
;;; Generated autoloads from mmbuffer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mmbuffer" '("mmbuffer-parse-")))

;;;***

;;;### (autoloads nil "mmexternal" "mmexternal.el" (0 0 0 0))
;;; Generated autoloads from mmexternal.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mmexternal" '("mmexternal-require-")))

;;;***

;;;### (autoloads nil "mmgeneric" "mmgeneric.el" (0 0 0 0))
;;; Generated autoloads from mmgeneric.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mmgeneric" '("mm-" "mime-")))

;;;***

;;;### (autoloads nil "ntlm" "ntlm.el" (0 0 0 0))
;;; Generated autoloads from ntlm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ntlm" '("ntlm-")))

;;;***

;;;### (autoloads nil "qmtp" "qmtp.el" (0 0 0 0))
;;; Generated autoloads from qmtp.el

(defvar qmtp-open-connection-function #'open-network-stream)

(autoload 'qmtp-via-qmtp "qmtp" "\


\(fn SENDER RECIPIENTS BUFFER)" nil nil)

(autoload 'qmtp-send-buffer "qmtp" "\


\(fn SENDER RECIPIENTS BUFFER)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "qmtp" '("qmtp-")))

;;;***

;;;### (autoloads nil "sasl" "sasl.el" (0 0 0 0))
;;; Generated autoloads from sasl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl" '("sasl-")))

;;;***

;;;### (autoloads nil "sasl-cram" "sasl-cram.el" (0 0 0 0))
;;; Generated autoloads from sasl-cram.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl-cram" '("sasl-cram-md5-")))

;;;***

;;;### (autoloads nil "sasl-digest" "sasl-digest.el" (0 0 0 0))
;;; Generated autoloads from sasl-digest.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl-digest" '("sasl-digest-md5-")))

;;;***

;;;### (autoloads nil "sasl-ntlm" "sasl-ntlm.el" (0 0 0 0))
;;; Generated autoloads from sasl-ntlm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl-ntlm" '("sasl-ntlm-")))

;;;***

;;;### (autoloads nil "sasl-scram" "sasl-scram.el" (0 0 0 0))
;;; Generated autoloads from sasl-scram.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl-scram" '("sasl-scram-md5-")))

;;;***

;;;### (autoloads nil "sasl-xoauth2" "sasl-xoauth2.el" (0 0 0 0))
;;; Generated autoloads from sasl-xoauth2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sasl-xoauth2" '("sasl-xoauth2-")))

;;;***

;;;### (autoloads nil "sha1" "sha1.el" (0 0 0 0))
;;; Generated autoloads from sha1.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sha1" '("sha1-dl-module")))

;;;***

;;;### (autoloads nil "sha1-el" "sha1-el.el" (0 0 0 0))
;;; Generated autoloads from sha1-el.el

(autoload 'sha1 "sha1-el" "\
Return the SHA1 (Secure Hash Algorithm) of an object.
OBJECT is either a string or a buffer.
Optional arguments BEG and END denote buffer positions for computing the
hash of a portion of OBJECT.
If BINARY is non-nil, return a string in binary form.

\(fn OBJECT &optional BEG END BINARY)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sha1-el" '("sha1-")))

;;;***

;;;### (autoloads nil "smtp" "smtp.el" (0 0 0 0))
;;; Generated autoloads from smtp.el

(defvar smtp-open-connection-function #'open-network-stream "\
*Function used for connecting to a SMTP server.
The function will be called with the same four arguments as
`open-network-stream' and should return a process object.
Here is an example:

\(setq smtp-open-connection-function
      #'(lambda (name buffer host service)
	  (let ((process-connection-type nil))
	    (start-process name buffer \"ssh\" \"-C\" host
			   \"nc\" host service))))

It connects to a SMTP server using \"ssh\" before actually connecting
to the SMTP port.  Where the command \"nc\" is the netcat executable;
see http://www.atstake.com/research/tools/index.html#network_utilities
for details.")

(autoload 'smtp-via-smtp "smtp" "\
Like `smtp-send-buffer', but sucks in any errors.

\(fn SENDER RECIPIENTS BUFFER)" nil nil)

(autoload 'smtp-send-buffer "smtp" "\
Send a message.
SENDER is an envelope sender address.
RECIPIENTS is a list of envelope recipient addresses.
BUFFER may be a buffer or a buffer name which contains mail message.

\(fn SENDER RECIPIENTS BUFFER)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smtp" '("smtp-")))

;;;***

;;;### (autoloads nil "std11" "std11.el" (0 0 0 0))
;;; Generated autoloads from std11.el

(autoload 'std11-fetch-field "std11" "\
Return the value of the header field NAME.
The buffer is expected to be narrowed to just the headers of the message.

\(fn NAME)" nil nil)

(autoload 'std11-narrow-to-header "std11" "\
Narrow to the message header.
If BOUNDARY is not nil, it is used as message header separator.

\(fn &optional BOUNDARY)" nil nil)

(autoload 'std11-field-body "std11" "\
Return the value of the header field NAME.
If BOUNDARY is not nil, it is used as message header separator.

\(fn NAME &optional BOUNDARY)" nil nil)

(autoload 'std11-unfold-string "std11" "\
Unfold STRING as message header field.

\(fn STRING)" nil nil)

(autoload 'std11-lexical-analyze "std11" "\
Analyze STRING as lexical tokens of STD 11.

\(fn STRING &optional ANALYZER START)" nil nil)

(autoload 'std11-address-string "std11" "\
Return string of address part from parsed ADDRESS of RFC 822.

\(fn ADDRESS)" nil nil)

(autoload 'std11-full-name-string "std11" "\
Return string of full-name part from parsed ADDRESS of RFC 822.

\(fn ADDRESS)" nil nil)

(autoload 'std11-msg-id-string "std11" "\
Return string from parsed MSG-ID of RFC 822.

\(fn MSG-ID)" nil nil)

(autoload 'std11-fill-msg-id-list-string "std11" "\
Fill list of msg-id in STRING, and return the result.

\(fn STRING &optional COLUMN)" nil nil)

(autoload 'std11-parse-address-string "std11" "\
Parse STRING as mail address.

\(fn STRING)" nil nil)

(autoload 'std11-parse-addresses-string "std11" "\
Parse STRING as mail address list.

\(fn STRING)" nil nil)

(autoload 'std11-parse-msg-id-string "std11" "\
Parse STRING as msg-id.

\(fn STRING)" nil nil)

(autoload 'std11-parse-msg-ids-string "std11" "\
Parse STRING as `*(phrase / msg-id)'.

\(fn STRING)" nil nil)

(autoload 'std11-extract-address-components "std11" "\
Extract full name and canonical address from STRING.
Returns a list of the form (FULL-NAME CANONICAL-ADDRESS).
If no name can be extracted, FULL-NAME will be nil.

\(fn STRING)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "std11" '("std11-")))

;;;***

;;;### (autoloads nil nil ("flim-pkg.el" "mmcooked.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flim-autoloads.el ends here
