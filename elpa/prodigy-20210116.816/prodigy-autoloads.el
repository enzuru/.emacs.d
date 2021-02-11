;;; prodigy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "prodigy" "prodigy.el" (0 0 0 0))
;;; Generated autoloads from prodigy.el

(autoload 'prodigy-add-filter "prodigy" "\
Add filter TYPE, that filters for VALUE.

\(fn TYPE VALUE)" nil nil)

(autoload 'prodigy-define-service "prodigy" "\
Define a new service with ARGS.

If service with that name already exists, the service is updated.
The old service process is transferred to the new service.

\(fn &rest ARGS)" nil nil)

(function-put 'prodigy-define-service 'lisp-indent-function 'defun)

(autoload 'prodigy-define-tag "prodigy" "\
Define a new tag with ARGS.

\(fn &rest ARGS)" nil nil)

(function-put 'prodigy-define-tag 'lisp-indent-function 'defun)

(autoload 'prodigy-define-status "prodigy" "\
Define a new status with ARGS.

\(fn &rest ARGS)" nil nil)

(function-put 'prodigy-define-status 'lisp-indent-function 'defun)

(autoload 'prodigy-mode "prodigy" "\
Special mode for prodigy buffers.

\(fn)" t nil)

(autoload 'prodigy-view-mode "prodigy" "\
Mode for viewing prodigy process output.

\(fn)" t nil)

(autoload 'prodigy "prodigy" "\
Manage external services from within Emacs." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "prodigy" '("prodigy-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; prodigy-autoloads.el ends here
