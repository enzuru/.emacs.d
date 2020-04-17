;;; flycheck-objc-clang.el --- Flycheck: Objective-C support using Clang -*- lexical-binding: t; -*-

;; Copyright (c) 2016-2019 GyazSquare Inc.

;; Author: Goichi Hirakawa <gooichi@gyazsquare.com>
;; URL: https://github.com/GyazSquare/flycheck-objc-clang
;; Package-Version: 20191116.1015
;; Version: 4.0.0
;; Keywords: convenience, languages, tools
;; Package-Requires: ((emacs "24.4") (flycheck "26"))

;; This file is not part of GNU Emacs.

;; MIT License

;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; Add Objective-C support to Flycheck using Clang.
;;
;; Usage:
;;
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-objc-clang-setup))

;;; Code:

(require 'flycheck)

(flycheck-def-option-var flycheck-objc-clang-xcrun-sdk nil objc-clang
  "Specify which SDK to search for tools.

When non-nil, set the SDK name to find the tools, via `--sdk'.
The option is available only on macOS.

Use `xcodebuild -showsdks' to list the available SDK names."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-xcrun-toolchain nil objc-clang
  "Specify which toolchain to use to perform the lookup.

When non-nil, set the toolchain identifier or name to use to
perform the lookup, via `--toolchain'.
The option is available only on macOS."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-language-standard nil objc-clang
  "Specify the language standard to compile for.

When non-nil, set the language standard via `-std'."
  :type '(choice (const :tag "Default standard" nil)
                 (string :tag "Language standard"))
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-arc nil objc-clang
  "Enable Objective-C Automatic Reference Counting (ARC).

When non-nil, enable ARC via `-fobjc-arc'.  It is disabled by
default.

See URL
`http://clang.llvm.org/docs/AutomaticReferenceCounting.html' for
more information about ARC."
  :type 'boolean
  :safe #'booleanp)

(flycheck-def-option-var flycheck-objc-clang-runtime nil objc-clang
  "Specify the target Objective-C runtime kind and version.

When non-nil, set the Objective-C runtime kind and version, via
`-fobjc-runtime'."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-weak nil objc-clang
  "Enable weak references in Manual Reference Counting (MRC).

When non-nil, enable ARC-stype weak references via
`-fobjc-weak'. It is disabled by default."
  :type 'boolean
  :safe #'booleanp)

(flycheck-def-option-var flycheck-objc-clang-modules nil objc-clang
  "Enable the modules feature.

When non-nil, enable the modules feature via `-fmodules'.  It is
disabled by default.

See URL `http://clang.llvm.org/docs/Modules.html' for more
information about modules."
  :type 'boolean
  :safe #'booleanp)

(flycheck-def-option-var flycheck-objc-clang-archs nil objc-clang
  "Specify the architecture to build for.

When non-nil, add the architectures via `-arch'."
  :type '(repeat (string :tag "Architecture name"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-ios-version-min nil objc-clang
  "Specifies iOS deployment target.

When non-nil, set iOS deployment target via
`-mios-version-min'."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-macosx-version-min nil objc-clang
       "Specify Mac OS X deployment target.

When non-nil, set Mac OS X deployment target via
`-mmacosx-version-min'."
       :type 'string
       :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-tvos-version-min nil objc-clang
  "Specify tvOS deployment target.

When non-nil, set tvOS deployment target via
`-mtvos-version-min'."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-watchos-version-min nil objc-clang
  "Specify watchOS deployment target.

When non-nil, set watchOS deployment target via
`-mwatchos-version-min'."
  :type 'string
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-warnings
    '("all"
      "extra"
      "error=non-modular-include-in-framework-module"
      "no-unused-parameter"
      "error=deprecated-objc-isa-usage"
      "duplicate-method-match"
      "undeclared-selector"
      "error=objc-root-class")
    objc-clang
  "Enable the specified warnings.

By default, all recommended warnings and some extra warnings are
enabled.

See URL `http://clang.llvm.org/docs/UsersManual.html' for more
information about warnings."
  :type '(choice (const :tag "Recommended warnings" nil)
                 (repeat :tag "Warnings" (string :tag "Warning name")))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-definitions nil objc-clang
  "Define preprocessor macros.

When non-nil, add an implicit #define into the predefines buffer
which is read before the source file is preprocessed, via `-D'."
  :type '(repeat (string :tag "Definition"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-system-framework-search-paths nil
                         objc-clang
  "Add directory to SYSTEM framework search path, absolute paths
are relative to -isysroot.

When non-nil, add the specified directory to the search path for
system framework include files, via `-iframeworkwithsysroot'.
The option is available in Clang 5 or later."
  :type '(repeat (directory :tag "System framework directory"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-includes nil objc-clang
  "Include files before parsing.

When non-nil, add an implicit #include into the predefines buffer
which is read before the source file is preprocessed, via
`-include'."
  :type '(repeat (file :tag "Include file"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-sysroot nil objc-clang
  "Set the system root directory (usually /).

When non-nil, set the system root directory via `-isysroot'."
  :type '(choice (const :tag "Default sysroot" nil)
                 (string :tag "Sysroot"))
  :safe #'stringp)

(flycheck-def-option-var flycheck-objc-clang-quote-include-paths nil objc-clang
  "Add directory to QUOTE include search paths.

When non-nil, add the specified directory to the search path for
QUOTE include files, via `-iquote'."
  :type '(repeat (directory :tag "QUOTE include directory"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-include-paths nil objc-clang
  "Add directory to include search paths.

When non-nil, add the specified directory to the search path for
include files, via `-I'."
  :type '(repeat (directory :tag "Include directory"))
  :safe #'flycheck-string-list-p)

(flycheck-def-option-var flycheck-objc-clang-framework-paths nil objc-clang
  "Add directory to framework include search paths.

When non-nil, add the specified directory to the search path for
framework include files, via `-F'."
  :type '(repeat (directory :tag "Framework directory"))
  :safe #'flycheck-string-list-p)

(defun flycheck-objc-clang--syntax-checking-command ()
  "Return the command to run for Objective-C syntax checking using Clang."
  (let ((xcrun-path (executable-find "xcrun"))
        (command
         '("clang"
           "-fsyntax-only"
           (eval (cond
                  ((eq major-mode 'objc-mode) '("-x" "objective-c"))
                  ((eq major-mode 'c-mode) '("-x" "c"))))
           (option "-std=" flycheck-objc-clang-language-standard concat)
           (option-flag "-fobjc-arc" flycheck-objc-clang-arc)
           (option "-fobjc-runtime=" flycheck-objc-clang-runtime concat)
           (option-flag "-fobjc-weak" flycheck-objc-clang-weak)
           (option-flag "-fmodules" flycheck-objc-clang-modules)
           (option-list "-arch" flycheck-objc-clang-archs)
           (option "-mios-version-min="
                   flycheck-objc-clang-ios-version-min concat)
           (option "-mmacosx-version-min="
                   flycheck-objc-clang-macosx-version-min concat)
           (option "-mtvos-version-min="
                   flycheck-objc-clang-tvos-version-min concat)
           (option "-mwatchos-version-min="
                   flycheck-objc-clang-watchos-version-min concat)
           (option-list "-W" flycheck-objc-clang-warnings concat)
           "-fno-color-diagnostics"
           "-fno-caret-diagnostics"
           "-fno-diagnostics-show-option"
           (option-list "-D" flycheck-objc-clang-definitions concat)
           (option-list "-iframeworkwithsysroot"
                        flycheck-objc-clang-system-framework-search-paths)
           (option-list "-include" flycheck-objc-clang-includes)
           (option "-isysroot" flycheck-objc-clang-sysroot)
           (option-list "-iquote" flycheck-objc-clang-quote-include-paths)
           (option-list "-I" flycheck-objc-clang-include-paths concat)
           (option-list "-F" flycheck-objc-clang-framework-paths concat)
           ;; Read from standard input
           "-")))
    (if xcrun-path
        (let ((xcrun-command
               `(,xcrun-path
                 (option "--sdk" flycheck-objc-clang-xcrun-sdk)
                 (option "--toolchain" flycheck-objc-clang-xcrun-toolchain))))
          (append xcrun-command command))
      command)))

(flycheck-define-command-checker 'objc-clang
  "An Objective-C syntax checker using Clang.

See URL `http://clang.llvm.org/'."
  :command (flycheck-objc-clang--syntax-checking-command)
  :standard-input t
  :error-patterns
  '((error line-start
           (message "In file included from") " " (or "<stdin>" (file-name))
           ":" line ":" line-end)
    (info line-start (or "<stdin>" (file-name)) ":" line ":" column
          ": " (or "note" "remark") ": " (optional (message)) line-end)
    (warning line-start (or "<stdin>" (file-name)) ":" line ":" column
             ": " "warning" ": " (optional (message)) line-end)
    (error line-start (or "<stdin>" (file-name)) ":" line ":" column
           ": " (or "error" "fatal error") ": " (optional (message)) line-end))
  :error-filter
  (lambda (errors)
    (let ((errors (flycheck-sanitize-errors errors)))
      (dolist (err errors)
        ;; Clang will output empty messages for #error / #warning pragmas
        ;; without messages.  We fill these empty errors with a dummy message
        ;; to get them past our error filtering.
        (setf (flycheck-error-message err)
              (or (flycheck-error-message err) "no message")))
      (flycheck-fold-include-levels errors "In file included from")))
  :modes 'objc-mode)

;;;###autoload
(defun flycheck-objc-clang-setup ()
  "Set up Flycheck for Objective-C using Clang."
  (add-to-list 'flycheck-checkers 'objc-clang))

(provide 'flycheck-objc-clang)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; flycheck-objc-clang.el ends here
