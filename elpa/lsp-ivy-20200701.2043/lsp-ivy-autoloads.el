;;; lsp-ivy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "lsp-ivy" "lsp-ivy.el" (0 0 0 0))
;;; Generated autoloads from lsp-ivy.el

(autoload 'lsp-ivy-workspace-symbol "lsp-ivy" "\
`ivy' for lsp workspace/symbol.
When called with prefix ARG the default selection will be symbol at point.

\(fn ARG)" t nil)

(autoload 'lsp-ivy-global-workspace-symbol "lsp-ivy" "\
`ivy' for lsp workspace/symbol for all of the current workspaces.
When called with prefix ARG the default selection will be symbol at point.

\(fn ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lsp-ivy" '("lsp-ivy-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lsp-ivy-autoloads.el ends here
