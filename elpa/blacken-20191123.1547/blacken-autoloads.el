;;; blacken-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "blacken" "blacken.el" (0 0 0 0))
;;; Generated autoloads from blacken.el

(autoload 'blacken-buffer "blacken" "\
Try to blacken the current buffer.

Show black output, if black exit abnormally and DISPLAY is t.

\(fn &optional DISPLAY)" t nil)

(autoload 'blacken-mode "blacken" "\
Automatically run black before saving.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "blacken" '("blacken-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; blacken-autoloads.el ends here
