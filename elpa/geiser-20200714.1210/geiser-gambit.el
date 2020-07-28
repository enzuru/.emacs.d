;;; geiser-gambit.el -- gambit's implementation of the geiser protocols

;; Copyright (C) 2014, 2015, 2019 Daniel Leslie

;; Based on geiser-guile.el by Jose Antonio Ortega Ruiz

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the Modified BSD License. You should
;; have received a copy of the license along with this program. If
;; not, see <http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5>.

;; Start date: Sun Mar 08, 2009 23:03

;;; Commentary:

;; Gambit in geiser, thank you to Chris Blom for the start he did few years ago
;; https://github.com/ChrisBlom

;; TODO
;; [ ] the gambit guessing words lists


;;; Code:

(require 'geiser-connection)
(require 'geiser-syntax)
(require 'geiser-custom)
(require 'geiser-base)
(require 'geiser-eval)
(require 'geiser-edit)
(require 'geiser-log)
(require 'geiser)

(require 'compile)
(require 'info-look)

(eval-when-compile (require 'cl-lib))

(defconst geiser-gambit--builtin-keywords
  '("##debug-repl" "##import" "define-macro" "##symbol-table" "##decompile"))

;;; Customization

(defgroup geiser-gambit nil
  "Customization for Geiser's Gambit flavour."
  :group 'geiser)

;; define the interpreter for geiser.
;; the geiser-costum--defcustom is a macro that will
;; call a declaration into the documentation of the
;; structure of the method and then define the method
;; with a defcustom: define a variable that represents an option users might want to set
(geiser-custom--defcustom geiser-gambit-binary
  (cond ((eq system-type 'windows-nt) '("gsi.exe"))
        (t "gsi"))
  "Name to use to call the gambit executable when starting a REPL."
  :type '(choice string (repeat string))
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-load-path nil
  "A list of paths to be added to gambit's load path when it's
started."
  :type '(repeat file)
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-compile-geiser-p t
  "Non-nil means that the Geiser runtime will be compiled on load."
  :type 'boolean
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-init-file "~/.gambit-geiser"
  "Initialization file with user code for the Gambit REPL.
If all you want is to load ~/.gambit, set
`geiser-gambit-load-init-file-p' instead."
  :type 'string
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-load-init-file-p nil
  "Whether to load ~/.gambit when starting Gambit.
Note that, due to peculiarities in the way Gambit loads its init
file, using `geiser-gambit-init-file' is not equivalent to setting
this variable to t."
  :type 'boolean
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-extra-keywords nil
  "Extra keywords highlighted in gambit scheme buffers."
  :type '(repeat string)
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-case-sensitive-p t
  "Non-nil means keyword highlighting is case-sensitive."
  :type 'boolean
  :group 'geiser-gambit)

;; TODO path for debugger and debugging functions

;;; REPL support:

(defun geiser-gambit--binary ()
  (if (listp geiser-gambit-binary)
      (car geiser-gambit-binary)
    geiser-gambit-binary))

(defconst geiser-gambit--prompt-regexp "> ")

(defconst geiser-gambit--debugger-prompt-regexp "[0-9]+> ")
;; taken from gerbil scheme
(geiser-custom--defcustom geiser-gambit-debug-show-bt-p t
  "Whether to automatically show a full backtrace when entering the debugger.
If `nil', only the last frame is shown."
  :type 'boolean
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-show-debug-help-p t
  "Whether to show brief help in the echo area when entering the debugger."
  :type 'boolean
  :group 'geiser-gambit)

(geiser-custom--defcustom geiser-gambit-jump-on-debug-p nil
  "Whether to automatically jump to error when entering the debugger.
If `t', Geiser will use `next-error' to jump to the error's location."
  :type 'boolean
  :group 'geiser-gambit)

;;; evaluation support when module loaded at opening
;;; the gambit/geiser# is the namespace of geiser module for gambit
(defun geiser-gambit--geiser-procedure (proc &rest args)
  (cl-case proc
    ((eval compile)
     (let* ((form (mapconcat 'identity (cdr args) " "))
            (module (cond ((string-equal "'()" (car args))
                           "'()")
                          ((and (car args) (not (string-prefix-p "'" (car args)))
                                (not (string-prefix-p "#" (car args))))
                           (concat "'" (car args)))
                          (t
                           "#f")))
            (cmd (format "(gambit/geiser#geiser:eval %s '%s)" module form)))
       cmd))
    ((load-file compile-file)
     (format "(gambit/geiser#geiser:load-file %s)" (car args)))
    ((no-values)
     "(gambit/geiser#geiser:no-values)")
    (t
     (let ((form (mapconcat 'identity args " ")))
       (format "(gambit/geiser#geiser:%s %s)" proc form)))))

;;(defconst geiser-gambit--module-re
;;  "( *module +\\(([^)]+)\\|[^ ]+\\)\\|( *define-library +\\(([^)]+)\\|[^ ]+\\)")

;;(defun geiser-gambit--module-cmd (module fmt &optional def)
;; (when module
;;    (let* ((module (geiser-gambit--get-module module))
;;           (module (cond ((or (null module) (eq module :f)) def)
;;                         (t (format "%s" module)))))
;;      (and module (format fmt module)))))

;; not supported by gambit
;;
;;(defun geiser-gambit--get-module (&optional module)
;;  (cond ((null module)
;;         (save-excursion
;;           (geiser-syntax--pop-to-top)
;;           (if (or (re-search-backward geiser-gambit--module-re nil t)
;;                   (looking-at geiser-gambit--library-re)
;;                   (re-search-forward geiser-gambit--module-re nil t))
;;               (geiser-gambit--get-module (match-string-no-properties 1))
;;             :f)))
;;        ((listp module) module)
;;        ((stringp module)
;;         (condition-case nil
;;             (car (geiser-syntax--read-from-string module))
;;           (error :f)))
;;        (t :f)))

;;(defun geiser-gambit--import-command (module)
;;  (geiser-gambit--module-cmd module ",use %s"))

;; not implemented by gambit for the moment
;;(defun geiser-gambit--enter-command (module)
;;  (geiser-gambit--module-cmd module ",m %s" module))

(defun geiser-gambit--exit-command () ",q")

(defun geiser-gambit--symbol-begin (module)
  (save-excursion (skip-syntax-backward "^-()> ") (point)))

;; error display

;;; Error display

(defun geiser-gambit--display-error (module key msg)
  (newline)
  (when (stringp msg)
    (save-excursion (insert msg))
    (geiser-edit--buttonize-files))
  (and (not key) msg (not (zerop (length msg)))))

;; TODO not sure
(defun geiser-gambit--enter-debugger ()
  (let ((bt-cmd (if geiser-gambit-debug-show-bt-p "\n#||#,b\n" "")))
    (compilation-forget-errors)
    (goto-char (point-max))
    (geiser-repl--prepare-send)
    (comint-send-string nil bt-cmd)
    (when geiser-gambit-show-debug-help-p
      (message "Debug REPL. Enter ,t to return to top level, ,? for help."))
    (when geiser-gambit-jump-on-debug-p
      (accept-process-output (get-buffer-process (current-buffer))
                             0.2 nil t)
      (ignore-errors (next-error)))))

;;; Trying to ascertain whether a buffer is Gambit Scheme:

(defconst geiser-gambit--guess-re
  (regexp-opt (append '("gsi" "gambit") geiser-gambit--builtin-keywords)))

(defun geiser-gambit--guess ()
  (save-excursion
    (goto-char (point-min))
    (re-search-forward geiser-gambit--guess-re nil t)))

;; no help at the moment TODO
;; (defun geiser-gambit--external-help (id module)
;;  "Loads gambit doc into a buffer"
;;  (browse-url (format "http://api.call-cc.org/cdoc?q=%s&query-name=Look+up" id)))

;;; Keywords and syntax

(defun geiser-gambit--keywords ()
  `(,geiser-gambit--builtin-keywords))

(geiser-syntax--scheme-indent
 (receive 2)
 (match 1)
 (match-lambda 0)
 (match-lambda* 0)
 (match-let scheme-let-indent)
 (match-let* 1)
 (match-letrec 1)
 (declare 0)
 (cond-expand 0)
 (let-values scheme-let-indent)
 (let*-values scheme-let-indent)
 (letrec-values 1)
 (letrec* 1)
 (parameterize scheme-let-indent)
 (let-location 1)
 (foreign-lambda 2)
 (foreign-lambda* 2)
 (foreign-primitive 2)
 (foreign-safe-lambda 2)
 (foreign-safe-lambda* 2)
 (set! 1)
 (let-optionals* 2)
 (let-optionals 2)
 (condition-case 1)
 (fluid-let 1)
 (and-let* 1)
 (assume 1)
 (cut 1)
 (cute 1)
 (when 1)
 (unless 1)
 (dotimes 1)
 (compiler-typecase 1)
 (ecase 1)
 (use 0)
 (require-extension 0)
 (import 0)
 (handle-exceptions 2)
 (regex-case 1)
 (define-inline 1)
 (define-constant 1)
 (define-syntax-rule 1)
 (define-record-type 1)
 (define-values 1)
 (define-record 1)
 (define-specialization 1)
 (define-type 1)
 (select 1)
 (functor 3)
 (define-interface 1)
 (module 2))

;;; REPL startup

(defconst geiser-gambit-minimum-version "v4.9.3")

(defun geiser-gambit--version (binary)
  (shell-command-to-string (format "%s -e \"(display (##system-version-string))\""
                                   binary)))

(defun geiser-gambit--parameters ()
  "Return a list with all parameters needed to start Gambit Scheme."
  ;; if your version of gambit support modules we directly load geiser module
  ;; else we go load the file in geiser
  (let* ((v (geiser-gambit--version (geiser-gambit--binary)))
         (gambit-version (substring v 1 (string-width v))))
    (if (version< gambit-version "4.9.4")
        `( "-:d-" ,(expand-file-name "gambit/geiser/gambit.scm" geiser-scheme-dir) "-" )
      `("-:d-" "gambit/geiser" "-"))))


(defun connect-to-gambit ()
  "Start a Gambit REPL connected to a remote process."
  (interactive)
  (geiser-connect 'gambit))

(defun geiser-gambit--startup (remote)
  (compilation-setup t))
;;; Implementation definition:

(define-geiser-implementation gambit
  (unsupported-procedures '(callers callees generic-methods
				    module-location symbol-documentation))
  (binary geiser-gambit--binary)
  (arglist geiser-gambit--parameters)
  (version-command geiser-gambit--version)
  (minimum-version geiser-gambit-minimum-version)
  (repl-startup geiser-gambit--startup)
  (prompt-regexp geiser-gambit--prompt-regexp)
  (debugger-prompt-regexp geiser-gambit--debugger-prompt-regexp)
  (enter-debugger geiser-gambit--enter-debugger)
  (marshall-procedure geiser-gambit--geiser-procedure)
  ;;  (find-module geiser-gambit--get-module)
  ;;  (enter-command geiser-gambit--enter-command)
  (exit-command geiser-gambit--exit-command)
  ;;  (import-command geiser-gambit--import-command)
  (find-symbol-begin geiser-gambit--symbol-begin)
  (display-error geiser-gambit--display-error)
  ;;  (external-help geiser-gambit--external-help)
  (check-buffer geiser-gambit--guess)
  (keywords geiser-gambit--keywords)
  (case-sensitive geiser-gambit-case-sensitive-p))

(geiser-impl--add-to-alist 'regexp "\\.scm$" 'gambit t)

(provide 'geiser-gambit)
