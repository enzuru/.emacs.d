;; Custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "bd82c92996136fdacbb4ae672785506b8d1d1d511df90a502674a51808ecc89f" "d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "6ce5839b440284fca58bf2aa3e70335c7028701a19b54e556b78485ed153d309" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))
 '(mu-worlds
   '(["SquareSoft" "uossmud.sandwich.net" 9000 "guest" "guest"]))
 '(package-selected-packages 'nil)
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook 'org-html-export-to-html)
     (eval progn
           (require 'lisp-mode)
           (defun emacs27-lisp-fill-paragraph
               (&optional justify)
             (interactive "P")
             (or
              (fill-comment-paragraph justify)
              (let
                  ((paragraph-start
                    (concat paragraph-start "\\|\\s-*\\([(;\"]\\|\\s-:\\|`(\\|#'(\\)"))
                   (paragraph-separate
                    (concat paragraph-separate "\\|\\s-*\".*[,\\.]$"))
                   (fill-column
                    (if
                        (and
                         (integerp emacs-lisp-docstring-fill-column)
                         (derived-mode-p 'emacs-lisp-mode))
                        emacs-lisp-docstring-fill-column fill-column)))
                (fill-paragraph justify))
              t))
           (setq-local fill-paragraph-function #'emacs27-lisp-fill-paragraph))
     (eval with-eval-after-load 'yasnippet
           (let
               ((guix-yasnippets
                 (expand-file-name "etc/snippets/yas"
                                   (locate-dominating-file default-directory ".dir-locals.el"))))
             (unless
                 (member guix-yasnippets yas-snippet-dirs)
               (add-to-list 'yas-snippet-dirs guix-yasnippets)
               (yas-reload-all))))
     (eval add-to-list 'completion-ignored-extensions ".go")
     (eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (eval let
           ((root-dir-unexpanded
             (locate-dominating-file default-directory ".dir-locals.el")))
           (when root-dir-unexpanded
             (let*
                 ((root-dir
                   (expand-file-name root-dir-unexpanded))
                  (root-dir*
                   (directory-file-name root-dir)))
               (unless
                   (boundp 'geiser-guile-load-path)
                 (defvar geiser-guile-load-path 'nil))
               (make-local-variable 'geiser-guile-load-path)
               (require 'cl-lib)
               (cl-pushnew root-dir* geiser-guile-load-path :test #'string-equal))))
     (eval setq-local guix-directory
           (locate-dominating-file default-directory ".dir-locals.el"))))
 '(smtpmail-smtp-server "mail.enzu.ru")
 '(smtpmail-smtp-service 587)
 '(tab-bar-show nil)
 '(warning-suppress-types '((server) (comp))))
