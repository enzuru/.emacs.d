;;; apel-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "alist" "alist.el" (0 0 0 0))
;;; Generated autoloads from alist.el

(autoload 'put-alist "alist" "\
Set cdr of an element (KEY . ...) in ALIST to VALUE and return ALIST.
If there is no such element, create a new pair (KEY . VALUE) and
return a new alist whose car is the new pair and cdr is ALIST.

\(fn KEY VALUE ALIST)" nil nil)

(autoload 'del-alist "alist" "\
Delete an element whose car equals KEY from ALIST.
Return the modified ALIST.

\(fn KEY ALIST)" nil nil)

(autoload 'set-alist "alist" "\
Set cdr of an element (KEY . ...) in the alist bound to SYMBOL to VALUE.

\(fn SYMBOL KEY VALUE)" nil nil)

(autoload 'remove-alist "alist" "\
Delete an element whose car equals KEY from the alist bound to SYMBOL.

\(fn SYMBOL KEY)" nil nil)

(autoload 'modify-alist "alist" "\
Store elements in the alist MODIFIER in the alist DEFAULT.
Return the modified alist.

\(fn MODIFIER DEFAULT)" nil nil)

(autoload 'set-modified-alist "alist" "\
Store elements in the alist MODIFIER in an alist bound to SYMBOL.
If SYMBOL is not bound, set it to nil at first.

\(fn SYMBOL MODIFIER)" nil nil)

(autoload 'vassoc "alist" "\
Search AVLIST for an element whose first element equals KEY.
AVLIST is a list of vectors.
See also `assoc'.

\(fn KEY AVLIST)" nil nil)

;;;***

;;;### (autoloads nil "apel-ver" "apel-ver.el" (0 0 0 0))
;;; Generated autoloads from apel-ver.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "apel-ver" '("apel-version")))

;;;***

;;;### (autoloads nil "broken" "broken.el" (0 0 0 0))
;;; Generated autoloads from broken.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "broken" '("broken-facility" "check-broken-facility" "if-broken" "unless-broken" "when-broken")))

;;;***

;;;### (autoloads nil "calist" "calist.el" (0 0 0 0))
;;; Generated autoloads from calist.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "calist" '("calist-" "ctree-" "define-calist-field-match-method" "find-calist-package" "in-calist-package" "make-calist-package" "use-calist-package")))

;;;***

;;;### (autoloads nil "emu" "emu.el" (0 0 0 0))
;;; Generated autoloads from emu.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emu" '("char-" "insert-binary-file-contents" "mouse-button-" "running-")))

;;;***

;;;### (autoloads nil "filename" "filename.el" (0 0 0 0))
;;; Generated autoloads from filename.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "filename" '("filename-" "poly-funcall" "replace-as-filename")))

;;;***

;;;### (autoloads nil "install" "install.el" (0 0 0 0))
;;; Generated autoloads from install.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "install" '("compile-elisp-module" "install-")))

;;;***

;;;### (autoloads nil "inv-23" "inv-23.el" (0 0 0 0))
;;; Generated autoloads from inv-23.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "inv-23" '("disable-invisible" "enable-invisible" "end-of-invisible" "invisible-region" "next-visible-point" "visible-region")))

;;;***

;;;### (autoloads nil "mcharset" "mcharset.el" (0 0 0 0))
;;; Generated autoloads from mcharset.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mcharset" '("charsets-to-mime-charset" "default-mime-charset-" "find-mime-charset-by-charsets")))

;;;***

;;;### (autoloads nil "mcs-20" "mcs-20.el" (0 0 0 0))
;;; Generated autoloads from mcs-20.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mcs-20" '("default-mime-charset" "detect-mime-charset-" "mime-charset-" "widget-mime-charset-" "write-region-as-mime-charset")))

;;;***

;;;### (autoloads nil "mcs-e20" "mcs-e20.el" (0 0 0 0))
;;; Generated autoloads from mcs-e20.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mcs-e20" '("charsets-mime-charset-alist" "coding-system-to-mime-charset" "decode-mime-charset-" "encode-mime-charset-" "mime-charset-list")))

;;;***

;;;### (autoloads nil "mule-caesar" "mule-caesar.el" (0 0 0 0))
;;; Generated autoloads from mule-caesar.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mule-caesar" '("mule-caesar-region")))

;;;***

;;;### (autoloads nil "path-util" "path-util.el" (0 0 0 0))
;;; Generated autoloads from path-util.el

(autoload 'add-path "path-util" "\
Add PATH to `load-path' if it exists under `default-load-path'
directories and it does not exist in `load-path'.

You can use following PATH styles:
	load-path relative: \"PATH/\"
			(it is searched from `default-load-path')
	home directory relative: \"~/PATH/\" \"~USER/PATH/\"
	absolute path: \"/HOO/BAR/BAZ/\"

You can specify following OPTIONS:
	'all-paths	search from `load-path'
			instead of `default-load-path'
	'append		add PATH to the last of `load-path'

\(fn PATH &rest OPTIONS)" nil nil)

(autoload 'add-latest-path "path-util" "\
Add latest path matched by PATTERN to `load-path'
if it exists under `default-load-path' directories
and it does not exist in `load-path'.

If optional argument ALL-PATHS is specified, it is searched from all
of load-path instead of default-load-path.

\(fn PATTERN &optional ALL-PATHS)" nil nil)

(autoload 'get-latest-path "path-util" "\
Return latest directory in default-load-path
which is matched to regexp PATTERN.
If optional argument ALL-PATHS is specified,
it is searched from all of load-path instead of default-load-path.

\(fn PATTERN &optional ALL-PATHS)" nil nil)

(autoload 'file-installed-p "path-util" "\
Return absolute-path of FILE if FILE exists in PATHS.
If PATHS is omitted, `load-path' is used.

\(fn FILE &optional PATHS)" nil nil)

(defvar exec-suffix-list '("") "\
*List of suffixes for executable.")

(autoload 'exec-installed-p "path-util" "\
Return absolute-path of FILE if FILE exists in PATHS.
If PATHS is omitted, `exec-path' is used.
If suffixes is omitted, `exec-suffix-list' is used.

\(fn FILE &optional PATHS SUFFIXES)" nil nil)

(autoload 'module-installed-p "path-util" "\
Return t if module is provided or exists in PATHS.
If PATHS is omitted, `load-path' is used.

\(fn MODULE &optional PATHS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "path-util" '("default-load-path")))

;;;***

;;;### (autoloads nil "pces-20" "pces-20.el" (0 0 0 0))
;;; Generated autoloads from pces-20.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pces-20" '("as-binary-" "find-file-noselect-as-" "insert-file-contents-as-" "open-network-stream-as-binary" "save-buffer-as-" "write-region-as-")))

;;;***

;;;### (autoloads nil "pces-e20" "pces-e20.el" (0 0 0 0))
;;; Generated autoloads from pces-e20.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pces-e20" '("find-coding-system" "set-process-input-coding-system")))

;;;***

;;;### (autoloads nil "poe" "poe.el" (0 0 0 0))
;;; Generated autoloads from poe.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poe" '("buffer-file-type" "cancel-undo-boundary" "character-to-event" "event-to-character" "find-face" "next-command-event" "rem" "save-selected-frame")))

;;;***

;;;### (autoloads nil "poem" "poem.el" (0 0 0 0))
;;; Generated autoloads from poem.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poem" '("char-" "int-char")))

;;;***

;;;### (autoloads nil "poem-e20" "poem-e20.el" (0 0 0 0))
;;; Generated autoloads from poem-e20.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poem-e20" '("find-non-ascii-charset-" "fontset-pixel-size")))

;;;***

;;;### (autoloads nil "poem-e20_3" "poem-e20_3.el" (0 0 0 0))
;;; Generated autoloads from poem-e20_3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poem-e20_3" '("char-" "looking-at-as-unibyte" "sset" "string-to-")))

;;;***

;;;### (autoloads nil "product" "product.el" (0 0 0 0))
;;; Generated autoloads from product.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "product" '("product-")))

;;;***

;;;### (autoloads nil "pym" "pym.el" (0 0 0 0))
;;; Generated autoloads from pym.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pym" '("def-edebug-spec" "defalias-maybe" "defconst-maybe" "defmacro-maybe" "defsubst-maybe" "defun-maybe" "defvar-maybe" "subr-fboundp")))

;;;***

;;;### (autoloads nil "richtext" "richtext.el" (0 0 0 0))
;;; Generated autoloads from richtext.el

(autoload 'richtext-encode "richtext" "\


\(fn FROM TO)" nil nil)

(autoload 'richtext-decode "richtext" "\


\(fn FROM TO)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "richtext" '("richtext-")))

;;;***

;;;### (autoloads nil "static" "static.el" (0 0 0 0))
;;; Generated autoloads from static.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "static" '("static-")))

;;;***

;;;### (autoloads nil nil ("apel-pkg.el" "invisible.el" "pccl-20.el"
;;;;;;  "pccl.el" "pces.el" "pcustom.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; apel-autoloads.el ends here
