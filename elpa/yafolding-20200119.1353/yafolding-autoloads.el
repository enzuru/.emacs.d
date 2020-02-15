;;; yafolding-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "yafolding" "yafolding.el" (0 0 0 0))
;;; Generated autoloads from yafolding.el

(defvar yafolding-mode-map (let ((map (make-sparse-keymap))) (define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element) (define-key map (kbd "<C-M-return>") #'yafolding-toggle-all) (define-key map (kbd "<C-return>") #'yafolding-toggle-element) map))

(autoload 'yafolding-mode "yafolding" "\
Toggle yafolding mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "yafolding" '("yafolding-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yafolding-autoloads.el ends here
