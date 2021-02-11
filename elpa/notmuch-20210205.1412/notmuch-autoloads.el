;;; notmuch-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "coolj" "coolj.el" (0 0 0 0))
;;; Generated autoloads from coolj.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "coolj" '("coolj-")))

;;;***

;;;### (autoloads nil "make-deps" "make-deps.el" (0 0 0 0))
;;; Generated autoloads from make-deps.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "make-deps" '("batch-make-deps" "make-deps")))

;;;***

;;;### (autoloads nil "notmuch" "notmuch.el" (0 0 0 0))
;;; Generated autoloads from notmuch.el

(autoload 'notmuch-search "notmuch" "\
Display threads matching QUERY in a notmuch-search buffer.

If QUERY is nil, it is read interactively from the minibuffer.
Other optional parameters are used as follows:

  OLDEST-FIRST: A Boolean controlling the sort order of returned threads
  TARGET-THREAD: A thread ID (without the thread: prefix) that will be made
                 current if it appears in the search results.
  TARGET-LINE: The line number to move to if the target thread does not
               appear in the search results.
  NO-DISPLAY: Do not try to foreground the search results buffer. If it is
              already foregrounded i.e. displayed in a window, this has no
              effect, meaning the buffer will remain visible.

When called interactively, this will prompt for a query and use
the configured default sort order.

\(fn &optional QUERY OLDEST-FIRST TARGET-THREAD TARGET-LINE NO-DISPLAY)" t nil)

(autoload 'notmuch "notmuch" "\
Run notmuch and display saved searches, known tags, etc." t nil)

(autoload 'notmuch-cycle-notmuch-buffers "notmuch" "\
Cycle through any existing notmuch buffers (search, show or hello).

If the current buffer is the only notmuch buffer, bury it.
If no notmuch buffers exist, run `notmuch'." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-address" "notmuch-address.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from notmuch-address.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-address" '("notmuch-address-")))

;;;***

;;;### (autoloads nil "notmuch-company" "notmuch-company.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from notmuch-company.el

(autoload 'notmuch-company-setup "notmuch-company" nil nil nil)

(autoload 'notmuch-company "notmuch-company" "\
`company-mode' completion back-end for `notmuch'.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-company" '("notmuch-company-last-prefix")))

;;;***

;;;### (autoloads nil "notmuch-compat" "notmuch-compat.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from notmuch-compat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-compat" '("notmuch-message--fold-long-headers")))

;;;***

;;;### (autoloads nil "notmuch-crypto" "notmuch-crypto.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from notmuch-crypto.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-crypto" '("notmuch-crypto-")))

;;;***

;;;### (autoloads nil "notmuch-draft" "notmuch-draft.el" (0 0 0 0))
;;; Generated autoloads from notmuch-draft.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-draft" '("notmuch-draft-")))

;;;***

;;;### (autoloads nil "notmuch-hello" "notmuch-hello.el" (0 0 0 0))
;;; Generated autoloads from notmuch-hello.el

(autoload 'notmuch-hello "notmuch-hello" "\
Run notmuch and display saved searches, known tags, etc.

\(fn &optional NO-DISPLAY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-hello" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-jump" "notmuch-jump.el" (0 0 0 0))
;;; Generated autoloads from notmuch-jump.el

(autoload 'notmuch-jump-search "notmuch-jump" "\
Jump to a saved search by shortcut key.

This prompts for and performs a saved search using the shortcut
keys configured in the :key property of `notmuch-saved-searches'.
Typically these shortcuts are a single key long, so this is a
fast way to jump to a saved search from anywhere in Notmuch." t nil)

(autoload 'notmuch-jump "notmuch-jump" "\
Interactively prompt for one of the keys in ACTION-MAP.

Displays a summary of all bindings in ACTION-MAP in the
minibuffer, reads a key from the minibuffer, and performs the
corresponding action.  The prompt can be canceled with C-g or
RET.  PROMPT must be a string to use for the prompt.  PROMPT
should include a space at the end.

ACTION-MAP must be a list of triples of the form
  (KEY LABEL ACTION)
where KEY is a key binding, LABEL is a string label to display in
the buffer, and ACTION is a nullary function to call.  LABEL may
be null, in which case the action will still be bound, but will
not appear in the pop-up buffer.

\(fn ACTION-MAP PROMPT)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-jump" '("notmuch-jump-")))

;;;***

;;;### (autoloads nil "notmuch-lib" "notmuch-lib.el" (0 0 0 0))
;;; Generated autoloads from notmuch-lib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-lib" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-maildir-fcc" "notmuch-maildir-fcc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from notmuch-maildir-fcc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-maildir-fcc" '("notmuch-" "with-temporary-notmuch-message-buffer")))

;;;***

;;;### (autoloads nil "notmuch-message" "notmuch-message.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from notmuch-message.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-message" '("notmuch-message-")))

;;;***

;;;### (autoloads nil "notmuch-mua" "notmuch-mua.el" (0 0 0 0))
;;; Generated autoloads from notmuch-mua.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-mua" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-parser" "notmuch-parser.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from notmuch-parser.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-parser" '("notmuch-sexp-")))

;;;***

;;;### (autoloads nil "notmuch-print" "notmuch-print.el" (0 0 0 0))
;;; Generated autoloads from notmuch-print.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-print" '("notmuch-print-")))

;;;***

;;;### (autoloads nil "notmuch-query" "notmuch-query.el" (0 0 0 0))
;;; Generated autoloads from notmuch-query.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-query" '("notmuch-query-")))

;;;***

;;;### (autoloads nil "notmuch-show" "notmuch-show.el" (0 0 0 0))
;;; Generated autoloads from notmuch-show.el

(autoload 'notmuch-show "notmuch-show" "\
Run \"notmuch show\" with the given thread ID and display results.

ELIDE-TOGGLE, if non-nil, inverts the default elide behavior.

The optional PARENT-BUFFER is the notmuch-search buffer from
which this notmuch-show command was executed, (so that the
next thread from that buffer can be show when done with this
one).

The optional QUERY-CONTEXT is a notmuch search term. Only
messages from the thread matching this search term are shown if
non-nil.

The optional BUFFER-NAME provides the name of the buffer in
which the message thread is shown. If it is nil (which occurs
when the command is called interactively) the argument to the
function is used.

Returns the buffer containing the messages, or NIL if no messages
matched.

\(fn THREAD-ID &optional ELIDE-TOGGLE PARENT-BUFFER QUERY-CONTEXT BUFFER-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-show" '("notmuch-" "with-current-notmuch-show-message")))

;;;***

;;;### (autoloads nil "notmuch-tag" "notmuch-tag.el" (0 0 0 0))
;;; Generated autoloads from notmuch-tag.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-tag" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-tree" "notmuch-tree.el" (0 0 0 0))
;;; Generated autoloads from notmuch-tree.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-tree" '("notmuch-")))

;;;***

;;;### (autoloads nil "notmuch-wash" "notmuch-wash.el" (0 0 0 0))
;;; Generated autoloads from notmuch-wash.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "notmuch-wash" '("notmuch-wash-")))

;;;***

;;;### (autoloads nil "rstdoc" "rstdoc.el" (0 0 0 0))
;;; Generated autoloads from rstdoc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rstdoc" '("rst")))

;;;***

;;;### (autoloads nil nil ("notmuch-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; notmuch-autoloads.el ends here
