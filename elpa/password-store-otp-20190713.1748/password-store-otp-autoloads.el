;;; password-store-otp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "password-store-otp" "password-store-otp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from password-store-otp.el

(autoload 'password-store-otp-token-copy "password-store-otp" "\
Copy an OTP token from ENTRY to clipboard.

\(fn ENTRY)" t nil)

(autoload 'password-store-otp-uri-copy "password-store-otp" "\
Copy an OTP URI from ENTRY to clipboard.

\(fn ENTRY)" t nil)

(autoload 'password-store-otp-insert "password-store-otp" "\
Insert a new ENTRY containing OTP-URI.

\(fn ENTRY OTP-URI)" t nil)

(autoload 'password-store-otp-append "password-store-otp" "\
Append to an ENTRY the given OTP-URI.

\(fn ENTRY OTP-URI)" t nil)

(autoload 'password-store-otp-append-from-image "password-store-otp" "\
Check clipboard for an image and scan it to get an OTP URI, append it to ENTRY.

\(fn ENTRY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "password-store-otp" '("password-store-otp-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; password-store-otp-autoloads.el ends here
