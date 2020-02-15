;;; rjsx-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "rjsx-mode" "rjsx-mode.el" (0 0 0 0))
;;; Generated autoloads from rjsx-mode.el

(autoload 'rjsx-mode "rjsx-mode" "\
Major mode for editing JSX files.

\(fn)" t nil)

(autoload 'rjsx-minor-mode "rjsx-mode" "\
Minor mode for parsing JSX syntax into an AST.

\(fn &optional ARG)" t nil)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

(autoload 'rjsx-comment-dwim "rjsx-mode" "\
RJSX implementation of `comment-dwim'. If called on a region,
this function delegates to `comment-or-uncomment-region'. If the
point is not in a JSX context, it delegates to the
`comment-dwim', otherwise it will comment the JSX AST node at
point using the apppriate comment delimiters.

For example: If point is on a JSX attribute or JSX expression, it
will comment the entire attribute using \"/* */\". , otherwise if
it's on a descendent JSX Element, it will use \"{/* */}\"
instead.

\(fn ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rjsx-mode" '("rjsx-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rjsx-mode-autoloads.el ends here
