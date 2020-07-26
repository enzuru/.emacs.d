;;; zenburn-theme-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "zenburn-theme" "zenburn-theme.el" (0 0 0 0))
;;; Generated autoloads from zenburn-theme.el

(defvar zenburn-override-colors-alist 'nil "\
Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist.")

(custom-autoload 'zenburn-override-colors-alist "zenburn-theme" t)

(and load-file-name (boundp 'custom-theme-load-path) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "zenburn-theme" '("zenburn")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; zenburn-theme-autoloads.el ends here
