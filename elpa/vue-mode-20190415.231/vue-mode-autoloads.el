;;; vue-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vue-mode" "vue-mode.el" (0 0 0 0))
;;; Generated autoloads from vue-mode.el

(autoload 'vue-mode-edit-all-indirect "vue-mode" "\
Open all subsections with `edit-indirect-mode' in seperate windows.
If KEEP-WINDOWS is set, do not delete other windows and keep the root window
open.

\(fn &optional KEEP-WINDOWS)" t nil)

(autoload 'vue-mode "vue-mode" "\


\(fn)" t nil)

(setq mmm-global-mode 'maybe)

(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vue-mode" '("vue-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vue-mode-autoloads.el ends here
