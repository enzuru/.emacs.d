;;; feature-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "feature-mode" "feature-mode.el" (0 0 0 0))
;;; Generated autoloads from feature-mode.el

(autoload 'feature-mode "feature-mode" "\
Major mode for editing plain text stories" t nil)

(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "feature-mode" '("build-keyword-matcher" "can-run-bundle" "expand-home-shellism" "feature-" "given-when-then-wordlength" "load-gherkin-i10n" "parse-gherkin-l10n" "project-file-exists" "should-run-docker-compose" "try-find-next")))

;;;***

;;;### (autoloads nil nil ("feature-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; feature-mode-autoloads.el ends here
