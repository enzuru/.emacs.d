;;; lispy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "le-clojure" "le-clojure.el" (0 0 0 0))
;;; Generated autoloads from le-clojure.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-clojure" '("lispy-")))

;;;***

;;;### (autoloads nil "le-hy" "le-hy.el" (0 0 0 0))
;;; Generated autoloads from le-hy.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-hy" '("lispy--")))

;;;***

;;;### (autoloads nil "le-julia" "le-julia.el" (0 0 0 0))
;;; Generated autoloads from le-julia.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-julia" '("lispy-")))

;;;***

;;;### (autoloads nil "le-lisp" "le-lisp.el" (0 0 0 0))
;;; Generated autoloads from le-lisp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-lisp" '("lispy-")))

;;;***

;;;### (autoloads nil "le-python" "le-python.el" (0 0 0 0))
;;; Generated autoloads from le-python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-python" '("lispy-")))

;;;***

;;;### (autoloads nil "le-racket" "le-racket.el" (0 0 0 0))
;;; Generated autoloads from le-racket.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-racket" '("lispy-")))

;;;***

;;;### (autoloads nil "le-scheme" "le-scheme.el" (0 0 0 0))
;;; Generated autoloads from le-scheme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "le-scheme" '("lispy-")))

;;;***

;;;### (autoloads nil "lispy" "lispy.el" (0 0 0 0))
;;; Generated autoloads from lispy.el

(autoload 'lispy-mode "lispy" "\
Minor mode for navigating and editing LISP dialects.

When `lispy-mode' is on, most unprefixed keys,
i.e. [a-zA-Z+-./<>], conditionally call commands instead of
self-inserting. The condition (called special further on) is one
of:

- the point is before \"(\"
- the point is after \")\"
- the region is active

For instance, when special, \"j\" moves down one sexp, otherwise
it inserts itself.

When special, [0-9] call `digit-argument'.

When `lispy-mode' is on, \"[\" and \"]\" move forward and
backward through lists, which is useful to move into special.

\\{lispy-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lispy" '("lh-knight" "lispy-" "mc/cmds-to-run-" "ac-trigger-commands" "unsupported-mode-error" "hydra-lispy-x")))

;;;***

;;;### (autoloads nil "lispy-inline" "lispy-inline.el" (0 0 0 0))
;;; Generated autoloads from lispy-inline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lispy-inline" '("lispy-")))

;;;***

;;;### (autoloads nil "lispy-tags" "lispy-tags.el" (0 0 0 0))
;;; Generated autoloads from lispy-tags.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lispy-tags" '("lispy-" "no-semantic-support")))

;;;***

;;;### (autoloads nil nil ("elpa.el" "lispy-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lispy-autoloads.el ends here
