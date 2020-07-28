;;; pylint-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pylint" "pylint.el" (0 0 0 0))
;;; Generated autoloads from pylint.el

(autoload 'pylint-insert-ignore-comment "pylint" "\
Insert a comment like \"# pylint: disable=msg1,msg2,...\".

This command repeatedly uses `completing-read' to match known
messages, and ultimately inserts a comma-separated list of all
the selected messages.

With prefix argument, only insert a comma-separated list (for
appending to an existing list).

\(fn &optional ARG)" t nil)

(autoload 'pylint "pylint" "\
Run PYLINT, and collect output in a buffer, much like `compile'.

While pylint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<pylint-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pylint found matches.

\\{pylint-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'pylint-add-key-bindings "pylint" "\


\(fn)" nil nil)

(autoload 'pylint-add-menu-items "pylint" "\


\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pylint" '("pylint-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pylint-autoloads.el ends here
