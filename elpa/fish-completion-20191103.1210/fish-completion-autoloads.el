;;; fish-completion-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "fish-completion" "fish-completion.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from fish-completion.el

(autoload 'fish-completion-mode "fish-completion" "\
Turn on/off fish shell completion in all future shells or Eshells.

In `shell', completion is replaced by fish completion.
In `eshell', fish completion is only used when `pcomplete' fails.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "fish-completion" '("fish-completion-" "global-fish-completion-mode" "turn-on-fish-completion-mode")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fish-completion-autoloads.el ends here
