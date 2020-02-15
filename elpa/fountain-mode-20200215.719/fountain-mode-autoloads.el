;;; fountain-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "fountain-mode" "fountain-mode.el" (0 0 0 0))
;;; Generated autoloads from fountain-mode.el

(add-to-list 'auto-mode-alist '("\\.fountain\\'" . fountain-mode))

(autoload 'fountain-mode "fountain-mode" "\
Major mode for screenwriting in Fountain markup.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "fountain-mode" '("fountain-" "define-fountain-font-lock-matcher")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fountain-mode-autoloads.el ends here
