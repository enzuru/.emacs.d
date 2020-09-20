;;; rvm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "rvm" "rvm.el" (0 0 0 0))
;;; Generated autoloads from rvm.el

(autoload 'rvm-use-default "rvm" "\
use the rvm-default ruby as the current ruby version" t nil)

(autoload 'rvm-activate-corresponding-ruby "rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and activates the configured ruby.
If no .rvmrc file is found, the default ruby is used insted." t nil)

(autoload 'rvm-use "rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

(autoload 'rvm-open-gem "rvm" "\


\(fn GEMHOME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rvm" '("rvm")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rvm-autoloads.el ends here
