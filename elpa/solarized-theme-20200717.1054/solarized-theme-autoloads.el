;;; solarized-theme-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "solarized" "solarized.el" (0 0 0 0))
;;; Generated autoloads from solarized.el

(autoload 'solarized-color-blend "solarized" "\
Blends COLOR1 onto COLOR2 with ALPHA.

COLOR1 and COLOR2 should be color names (e.g. \"white\") or RGB
triplet strings (e.g. \"#ff12ec\").

Alpha should be a float between 0 and 1.

Optional argument DIGITS-PER-COMPONENT can be either 4 (the default) or 2;
use the latter if you need a 24-bit specification of a color.

\(fn COLOR1 COLOR2 ALPHA &optional DIGITS-PER-COMPONENT)" nil nil)

(autoload 'solarized-create-color-palette "solarized" "\
Create color-palette from CORE-PALETTE.

The Returned color-palette has the same format as `solarized-color-palette'

\(fn CORE-PALETTE)" nil nil)

(when (and (boundp 'custom-theme-load-path) load-file-name) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized" '("solarized-")))

;;;***

;;;### (autoloads nil "solarized-dark-high-contrast-theme" "solarized-dark-high-contrast-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-dark-high-contrast-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-dark-high-contrast-theme" '("solarized-dark-high-contrast")))

;;;***

;;;### (autoloads nil "solarized-dark-theme" "solarized-dark-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-dark-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-dark-theme" '("solarized-dark")))

;;;***

;;;### (autoloads nil "solarized-faces" "solarized-faces.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from solarized-faces.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-faces" '("solarized-definition")))

;;;***

;;;### (autoloads nil "solarized-gruvbox-dark-theme" "solarized-gruvbox-dark-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-gruvbox-dark-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-gruvbox-dark-theme" '("solarized-gruvbox-dark")))

;;;***

;;;### (autoloads nil "solarized-gruvbox-light-theme" "solarized-gruvbox-light-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-gruvbox-light-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-gruvbox-light-theme" '("solarized-gruvbox-light")))

;;;***

;;;### (autoloads nil "solarized-light-high-contrast-theme" "solarized-light-high-contrast-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-light-high-contrast-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-light-high-contrast-theme" '("solarized-light-high-contrast")))

;;;***

;;;### (autoloads nil "solarized-light-theme" "solarized-light-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-light-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-light-theme" '("solarized-light")))

;;;***

;;;### (autoloads nil "solarized-palettes" "solarized-palettes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-palettes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-palettes" '("solarized-")))

;;;***

;;;### (autoloads nil "solarized-theme-utils" "solarized-theme-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-theme-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-theme-utils" '("solarized-import-faces")))

;;;***

;;;### (autoloads nil "solarized-wombat-dark-theme" "solarized-wombat-dark-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-wombat-dark-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-wombat-dark-theme" '("solarized-wombat-dark")))

;;;***

;;;### (autoloads nil "solarized-zenburn-theme" "solarized-zenburn-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solarized-zenburn-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solarized-zenburn-theme" '("solarized-zenburn")))

;;;***

;;;### (autoloads nil nil ("solarized-theme-pkg.el" "solarized-theme.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; solarized-theme-autoloads.el ends here
