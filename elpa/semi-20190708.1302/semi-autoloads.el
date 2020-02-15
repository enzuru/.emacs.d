;;; semi-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "mime-bbdb" "mime-bbdb.el" (0 0 0 0))
;;; Generated autoloads from mime-bbdb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-bbdb" '("signature/" "mime-bbdb/")))

;;;***

;;;### (autoloads nil "mime-edit" "mime-edit.el" (0 0 0 0))
;;; Generated autoloads from mime-edit.el

(autoload 'mime-edit-mode "mime-edit" "\
MIME minor mode for editing the tagged MIME message.

In this mode, basically, the message is composed in the tagged MIME
format. The message tag looks like:

	--[[text/plain; charset=ISO-2022-JP][7bit]]

The tag specifies the MIME content type, subtype, optional parameters
and transfer encoding of the message following the tag.  Messages
without any tag are treated as `text/plain' by default.  Charset and
transfer encoding are automatically defined unless explicitly
specified.  Binary messages such as audio and image are usually
hidden.  The messages in the tagged MIME format are automatically
translated into a MIME compliant message when exiting this mode.

Available charsets depend on Emacs version being used.  The following
lists the available charsets of each emacs.

Without mule:	US-ASCII and ISO-8859-1 (or other charset) are available.
With mule:	US-ASCII, ISO-8859-* (except for ISO-8859-5), KOI8-R,
		ISO-2022-JP, ISO-2022-JP-2, EUC-KR, CN-GB-2312,
		CN-BIG5 and ISO-2022-INT-1 are available.

ISO-2022-JP-2 and ISO-2022-INT-1 charsets used in mule is expected to
be used to represent multilingual text in intermixed manner.  Any
languages that has no registered charset are represented as either
ISO-2022-JP-2 or ISO-2022-INT-1 in mule.

If you want to use non-ISO-8859-1 charset in Emacs 19 or XEmacs
without mule, please set variable `default-mime-charset'.  This
variable must be symbol of which name is a MIME charset.

If you want to add more charsets in mule, please set variable
`charsets-mime-charset-alist'.  This variable must be alist of which
key is list of charset and value is symbol of MIME charset.  If name
of coding-system is different as MIME charset, please set variable
`mime-charset-coding-system-alist'.  This variable must be alist of
which key is MIME charset and value is coding-system.

Following commands are available in addition to major mode commands:

\[make single part]
\\[mime-edit-insert-text]	insert a text message.
\\[mime-edit-insert-file]	insert a (binary) file.
\\[mime-eidt-insert-file-as-text] insert a text file.
\\[mime-edit-insert-external]	insert a reference to external body.
\\[mime-edit-insert-voice]	insert a voice message.
\\[mime-edit-insert-message]	insert a mail or news message.
\\[mime-edit-insert-mail]	insert a mail message.
\\[mime-edit-insert-signature]	insert a signature file at end.
\\[mime-edit-insert-key]	insert PGP public key.
\\[mime-edit-insert-tag]	insert a new MIME tag.

\[make enclosure (maybe multipart)]
\\[mime-edit-enclose-alternative-region]   enclose as multipart/alternative.
\\[mime-edit-enclose-parallel-region]	   enclose as multipart/parallel.
\\[mime-edit-enclose-mixed-region]	   enclose as multipart/mixed.
\\[mime-edit-enclose-digest-region]	   enclose as multipart/digest.
\\[mime-edit-enclose-pgp-signed-region]	   enclose as PGP signed.
\\[mime-edit-enclose-pgp-encrypted-region] enclose as PGP encrypted.
\\[mime-edit-enclose-quote-region]	   enclose as verbose mode
					   (to avoid to expand tags)

\[other commands]
\\[mime-edit-set-transfer-level-7bit]	set transfer-level as 7.
\\[mime-edit-set-transfer-level-8bit]	set transfer-level as 8.
\\[mime-edit-set-split]			set message splitting mode.
\\[mime-edit-set-sign]			set PGP-sign mode.
\\[mime-edit-set-encrypt]		set PGP-encryption mode.
\\[mime-edit-preview-message]		preview editing MIME message.
\\[mime-edit-exit]			exit and translate into a MIME
					compliant message.
\\[mime-edit-help]			show this help.
\\[mime-edit-maybe-translate]		exit and translate if in MIME mode,
					then split.

Additional commands are available in some major modes:
C-c C-c		exit, translate and run the original command.
C-c C-s		exit, translate and run the original command.

The following is a message example written in the tagged MIME format.
TABs at the beginning of the line are not a part of the message:

	This is a conventional plain text.  It should be translated
	into text/plain.
	--[[text/plain]]
	This is also a plain text.  But, it is explicitly specified as
	is.
	--[[text/plain; charset=ISO-8859-1]]
	This is also a plain text.  But charset is specified as
	iso-8859-1.

	¡Hola!  Buenos días.  ¿Cómo está usted?
	--[[text/enriched]]
	This is a <bold>enriched text</bold>.
	--[[image/gif][base64]]...image encoded in base64 here...
	--[[audio/basic][base64]]...audio encoded in base64 here...

User customizable variables (not documented all of them):
 mime-edit-prefix
    Specifies a key prefix for MIME minor mode commands.

 mime-ignore-preceding-spaces
    Preceding white spaces in a message body are ignored if non-nil.

 mime-ignore-trailing-spaces
    Trailing white spaces in a message body are ignored if non-nil.

 mime-auto-hide-body
    Hide a non-textual body message encoded in base64 after insertion
    if non-nil.

 mime-transfer-level
    A number of network transfer level.  It should be bigger than 7.
    If you are in 8bit-through environment, please set 8.

 mime-edit-voice-recorder
    Specifies a function to record a voice message and encode it.
    The function `mime-edit-voice-recorder-for-sun' is for Sun
    SparcStations.

 mime-edit-mode-hook
    Turning on MIME mode calls the value of mime-edit-mode-hook, if
    it is non-nil.

 mime-edit-translate-hook
    The value of mime-edit-translate-hook is called just before translating
    the tagged MIME format into a MIME compliant message if it is
    non-nil.  If the hook call the function mime-edit-insert-signature,
    the signature file will be inserted automatically.

 mime-edit-exit-hook
    Turning off MIME mode calls the value of mime-edit-exit-hook, if it is
    non-nil.

\(fn)" t nil)

(autoload 'turn-on-mime-edit "mime-edit" "\
Unconditionally turn on MIME-Edit mode.

\(fn)" t nil)

(defalias 'edit-mime 'turn-on-mime-edit)

(autoload 'mime-edit-decode-message-in-buffer "mime-edit" "\


\(fn &optional DEFAULT-CONTENT-TYPE NOT-DECODE-TEXT)" nil nil)

(autoload 'mime-edit-again "mime-edit" "\
Convert current buffer to MIME-Edit buffer and turn on MIME-Edit mode.
Content-Type and Content-Transfer-Encoding header fields will be
converted to MIME-Edit tags.

\(fn &optional NOT-DECODE-TEXT NO-SEPARATOR NOT-TURN-ON)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-edit" '("mime-" "eliminate-top-spaces" "replace-space-with-underline")))

;;;***

;;;### (autoloads nil "mime-image" "mime-image.el" (0 0 0 0))
;;; Generated autoloads from mime-image.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-image" '("mime-")))

;;;***

;;;### (autoloads nil "mime-mac" "mime-mac.el" (0 0 0 0))
;;; Generated autoloads from mime-mac.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-mac" '("mime-mac-save-and-play-with-")))

;;;***

;;;### (autoloads nil "mime-partial" "mime-partial.el" (0 0 0 0))
;;; Generated autoloads from mime-partial.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-partial" '("mime-combine-message/partial-pieces-automatically")))

;;;***

;;;### (autoloads nil "mime-pgp" "mime-pgp.el" (0 0 0 0))
;;; Generated autoloads from mime-pgp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-pgp" '("mime-")))

;;;***

;;;### (autoloads nil "mime-play" "mime-play.el" (0 0 0 0))
;;; Generated autoloads from mime-play.el

(autoload 'mime-preview-play-current-entity "mime-play" "\
Play current entity.
It decodes current entity to call internal or external method.  The
method is selected from variable `mime-acting-condition'.
If IGNORE-EXAMPLES (C-u prefix) is specified, this function ignores
`mime-acting-situation-example-list'.
If MODE is specified, play as it.  Default MODE is \"play\".

\(fn &optional IGNORE-EXAMPLES MODE)" t nil)

(autoload 'mime-play-entity "mime-play" "\
Play entity specified by ENTITY.
It decodes the entity to call internal or external method.  The method
is selected from variable `mime-acting-condition'.  If MODE is
specified, play as it.  Default MODE is \"play\".

\(fn ENTITY &optional SITUATION IGNORED-METHOD)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-play" '("mime-")))

;;;***

;;;### (autoloads nil "mime-shr" "mime-shr.el" (0 0 0 0))
;;; Generated autoloads from mime-shr.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-shr" '("mime-shr-")))

;;;***

;;;### (autoloads nil "mime-signature" "mime-signature.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mime-signature.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-signature" '("mime-edit-")))

;;;***

;;;### (autoloads nil "mime-tnef" "mime-tnef.el" (0 0 0 0))
;;; Generated autoloads from mime-tnef.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-tnef" '("mime-")))

;;;***

;;;### (autoloads nil "mime-vcard" "mime-vcard.el" (0 0 0 0))
;;; Generated autoloads from mime-vcard.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-vcard" '("mime-display-text/vcard")))

;;;***

;;;### (autoloads nil "mime-view" "mime-view.el" (0 0 0 0))
;;; Generated autoloads from mime-view.el

(autoload 'mime-display-message "mime-view" "\
View MESSAGE in MIME-View mode.

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
`mime-view-mode-default-map' is used.

\(fn MESSAGE &optional PREVIEW-BUFFER MOTHER DEFAULT-KEYMAP-OR-FUNCTION ORIGINAL-MAJOR-MODE KEYMAP)" nil nil)

(autoload 'mime-view-buffer "mime-view" "\
View RAW-BUFFER in MIME-View mode.
Optional argument PREVIEW-BUFFER is either nil or a name of preview
buffer.
Optional argument DEFAULT-KEYMAP-OR-FUNCTION is nil, keymap or
function.  If it is a keymap, keymap of MIME-View mode will be added
to it.  If it is a function, it will be bound as default binding of
keymap of MIME-View mode.
Optional argument REPRESENTATION-TYPE is representation-type of
message.  It must be nil, `binary' or `cooked'.  If it is nil,
`cooked' is used as default.

\(fn &optional RAW-BUFFER PREVIEW-BUFFER MOTHER DEFAULT-KEYMAP-OR-FUNCTION REPRESENTATION-TYPE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-view" '("mime-")))

;;;***

;;;### (autoloads nil "mime-w3" "mime-w3.el" (0 0 0 0))
;;; Generated autoloads from mime-w3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mime-w3" '("url-cid" "mime-")))

;;;***

;;;### (autoloads nil "postpet" "postpet.el" (0 0 0 0))
;;; Generated autoloads from postpet.el

(autoload 'postpet-decode "postpet" "\


\(fn STRING)" nil nil)

(autoload 'mime-display-application/x-postpet "postpet" "\


\(fn ENTITY SITUATION)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "postpet" '("unpack")))

;;;***

;;;### (autoloads nil "semi-def" "semi-def.el" (0 0 0 0))
;;; Generated autoloads from semi-def.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "semi-def" '("mime-")))

;;;***

;;;### (autoloads nil "semi-setup" "semi-setup.el" (0 0 0 0))
;;; Generated autoloads from semi-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "semi-setup" '("mime-setup-" "call-after-loaded")))

;;;***

;;;### (autoloads nil "signature" "signature.el" (0 0 0 0))
;;; Generated autoloads from signature.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "signature" '("insert-signature" "signature")))

;;;***

;;;### (autoloads nil nil ("mail-mime-setup.el" "mime-setup.el" "semi-pkg.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; semi-autoloads.el ends here
