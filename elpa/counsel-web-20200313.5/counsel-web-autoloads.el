;;; counsel-web-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "counsel-web" "counsel-web.el" (0 0 0 0))
;;; Generated autoloads from counsel-web.el

(autoload 'counsel-web-suggest "counsel-web" "\
Perform a web search with asynchronous suggestions.

INITIAL-INPUT can be given as the initial minibuffer input.
PROMPT, if non-nil, is passed as `ivy-read' prompt argument.
SUGGEST-FUNCTION, if non-nil, is called to perform the search.
ACTION, if non-nil, is called to load the selected candidate.

\(fn &optional INITIAL-INPUT PROMPT SUGGEST-FUNCTION ACTION)" t nil)

(autoload 'counsel-web-search "counsel-web" "\
Interactively search the web for STRING.

PROMPT, if non-nil, is passed as `ivy-read' prompt argument.
SEARCH-FUNCTION, if non-nil, is called to perform the search.
ACTION, if non-nil, is called to load the selected candidate.

\(fn &optional STRING PROMPT SEARCH-FUNCTION ACTION)" t nil)

(autoload 'counsel-web-thing-at-point "counsel-web" "\
Interactively search the web for the THING at point.

\(fn THING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "counsel-web" '("counsel-web-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; counsel-web-autoloads.el ends here
