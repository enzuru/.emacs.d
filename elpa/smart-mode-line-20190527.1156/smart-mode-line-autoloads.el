;;; smart-mode-line-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "smart-mode-line" "smart-mode-line.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from smart-mode-line.el

(when load-file-name (let ((dir (file-name-as-directory (file-name-directory load-file-name)))) (add-to-list 'custom-theme-load-path dir) (when (file-directory-p (file-name-as-directory (concat dir "themes"))) (add-to-list 'custom-theme-load-path (file-name-as-directory (concat dir "themes"))))))

(autoload 'sml/setup "smart-mode-line" "\
Setup the mode-line to be smart and sexy.

ARG is ignored. Just call this function in your init file, and
the mode-line will be setup.

\(fn &optional ARG)" t nil)

(defalias 'smart-mode-line-enable #'sml/setup)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smart-mode-line" '("sml/")))

;;;***

;;;### (autoloads nil "smart-mode-line-dark-theme" "smart-mode-line-dark-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from smart-mode-line-dark-theme.el

(when load-file-name (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smart-mode-line-dark-theme" '("smart-mode-line-dark")))

;;;***

;;;### (autoloads nil "smart-mode-line-light-theme" "smart-mode-line-light-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from smart-mode-line-light-theme.el

(when load-file-name (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smart-mode-line-light-theme" '("smart-mode-line-light")))

;;;***

;;;### (autoloads nil "smart-mode-line-respectful-theme" "smart-mode-line-respectful-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from smart-mode-line-respectful-theme.el

(when load-file-name (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smart-mode-line-respectful-theme" '("smart-mode-line-respectful")))

;;;***

;;;### (autoloads nil nil ("smart-mode-line-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; smart-mode-line-autoloads.el ends here
