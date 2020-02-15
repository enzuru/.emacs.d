;;; enh-ruby-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "enh-ruby-mode" "enh-ruby-mode.el" (0 0 0 0))
;;; Generated autoloads from enh-ruby-mode.el

(autoload 'enh/symbol-or-null-p "enh-ruby-mode" "\
Return true if X is either a symbol or null. Used for defcustom safe check.

\(fn X)" nil nil)

(autoload 'enh-ruby-mode "enh-ruby-mode" "\
Enhanced Major mode for editing Ruby code.

\\{enh-ruby-mode-map}

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "enh-ruby-mode" '("extra-col-%" "erm-" "enh-ruby-")))

;;;***

;;;### (autoloads nil nil ("enh-ruby-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; enh-ruby-mode-autoloads.el ends here
