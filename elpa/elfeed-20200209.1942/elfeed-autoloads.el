;;; elfeed-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elfeed" "elfeed.el" (0 0 0 0))
;;; Generated autoloads from elfeed.el

(autoload 'elfeed-update "elfeed" "\
Update all the feeds in `elfeed-feeds'.

\(fn)" t nil)

(autoload 'elfeed "elfeed" "\
Enter elfeed.

\(fn)" t nil)

(autoload 'elfeed-load-opml "elfeed" "\
Load feeds from an OPML file into `elfeed-feeds'.
When called interactively, the changes to `elfeed-feeds' are
saved to your customization file.

\(fn FILE)" t nil)

(autoload 'elfeed-export-opml "elfeed" "\
Export the current feed listing to OPML-formatted FILE.

\(fn FILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed" '("elfeed-")))

;;;***

;;;### (autoloads nil "elfeed-csv" "elfeed-csv.el" (0 0 0 0))
;;; Generated autoloads from elfeed-csv.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-csv" '("elfeed-csv-")))

;;;***

;;;### (autoloads nil "elfeed-curl" "elfeed-curl.el" (0 0 0 0))
;;; Generated autoloads from elfeed-curl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-curl" '("elfeed-curl-")))

;;;***

;;;### (autoloads nil "elfeed-db" "elfeed-db.el" (0 0 0 0))
;;; Generated autoloads from elfeed-db.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-db" '("elfeed-" "with-elfeed-db-visit")))

;;;***

;;;### (autoloads nil "elfeed-lib" "elfeed-lib.el" (0 0 0 0))
;;; Generated autoloads from elfeed-lib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-lib" '("elfeed-")))

;;;***

;;;### (autoloads nil "elfeed-link" "elfeed-link.el" (0 0 0 0))
;;; Generated autoloads from elfeed-link.el

(autoload 'elfeed-link-store-link "elfeed-link" "\
Store a link to an elfeed search or entry buffer.

When storing a link to an entry, automatically extract all the
entry metadata.  These can be used in the capture templates as
%:elfeed-entry-<prop>.  See `elfeed-entry--create' for the list
of available props.

\(fn)" nil nil)

(autoload 'elfeed-link-open "elfeed-link" "\
Jump to an elfeed entry or search.

Depending on what FILTER-OR-ID looks like, we jump to either
search buffer or show a concrete entry.

\(fn FILTER-OR-ID)" nil nil)

(eval-after-load 'org `(funcall ',(lambda nil (if (version< (org-version) "9.0") (with-no-warnings (org-add-link-type "elfeed" #'elfeed-link-open) (add-hook 'org-store-link-functions #'elfeed-link-store-link)) (with-no-warnings (org-link-set-parameters "elfeed" :follow #'elfeed-link-open :store #'elfeed-link-store-link))))))

;;;***

;;;### (autoloads nil "elfeed-log" "elfeed-log.el" (0 0 0 0))
;;; Generated autoloads from elfeed-log.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-log" '("elfeed-log")))

;;;***

;;;### (autoloads nil "elfeed-search" "elfeed-search.el" (0 0 0 0))
;;; Generated autoloads from elfeed-search.el

(autoload 'elfeed-search-bookmark-handler "elfeed-search" "\
Jump to an elfeed-search bookmarked location.

\(fn RECORD)" nil nil)

(autoload 'elfeed-search-desktop-restore "elfeed-search" "\
Restore the state of an elfeed-search buffer on desktop restore.

\(fn FILE-NAME BUFFER-NAME SEARCH-FILTER)" nil nil)

(add-to-list 'desktop-buffer-mode-handlers '(elfeed-search-mode . elfeed-search-desktop-restore))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-search" '("elfeed-s")))

;;;***

;;;### (autoloads nil "elfeed-show" "elfeed-show.el" (0 0 0 0))
;;; Generated autoloads from elfeed-show.el

(autoload 'elfeed-show-bookmark-handler "elfeed-show" "\
Show the bookmarked entry saved in the `RECORD'.

\(fn RECORD)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elfeed-show" '("elfeed-")))

;;;***

;;;### (autoloads nil "xml-query" "xml-query.el" (0 0 0 0))
;;; Generated autoloads from xml-query.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xml-query" '("xml-query")))

;;;***

;;;### (autoloads nil nil ("elfeed-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elfeed-autoloads.el ends here
