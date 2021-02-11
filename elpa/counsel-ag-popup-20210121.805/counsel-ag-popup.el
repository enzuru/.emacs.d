;;; counsel-ag-popup.el --- Interactive search with counsel-ag -*- lexical-binding: t; -*-

;; Copyright (C) 2019-2021  Eder Elorriaga

;; Author: Eder Elorriaga <gexplorer8@gmail.com>
;; URL: https://github.com/gexplorer/counsel-ag-popup
;; Package-Version: 20210121.805
;; Package-Commit: 41d85fe36edd72da68f5009ad9cf9013cd19960d
;; Keywords: convenience, matching, tools
;; Version: 1.0
;; Package-Requires: ((emacs "26.1" ) (counsel "0.13.0") (transient "0.3.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Just call the interactive function `counsel-ag-popup' and use the
;; popup to configure the search.

;;; Code:

(require 'counsel)
(require 'transient)

(eval-when-compile
  (require 'subr-x))

(defun counsel-ag-popup--map-args (transient-args)
  "Convert TRANSIENT-ARGS to a string of args."
  (mapconcat
   (lambda (arg)
     (if (listp arg)
         (let ((args (cdr arg)))
           (mapconcat (lambda (x) (concat "--" x)) args " "))
       arg))
   transient-args
   " "))

(defvar counsel-ag-popup-file-type-list
  '("actionscript" "ada" "asciidoc" "asm" "batch" "bitbake" "bro" "cc" "cfmx"
    "chpl" "clojure" "coffee" "cpp" "crystal" "csharp" "css" "cython" "delphi"
    "dot" "ebuild" "elisp" "elixir" "elm" "erlang" "factor" "fortran" "fsharp"
    "gettext" "glsl" "go" "groovy" "haml" "handlebars" "haskell" "haxe" "hh"
    "html" "ini" "ipython" "jade" "java" "js" "json" "jsp" "julia" "kotlin"
    "less" "liquid" "lisp" "log" "lua" "m4" "make" "mako" "markdown" "mason"
    "matlab" "mathematica" "md" "mercury" "nim" "nix" "objc" "objcpp" "ocaml"
    "octave" "org" "parrot" "perl" "php" "pike" "plist" "plone" "proto" "puppet"
    "python" "qml" "racket" "rake" "restructuredtext" "rs" "r" "rdoc" "ruby"
    "rust" "salt" "sass" "scala" "scheme" "shell" "smalltalk" "sml" "sql"
    "stylus" "swift" "tcl" "tex" "tt" "toml" "ts" "twig" "vala" "vb" "velocity"
    "verilog" "vhdl" "vim" "wix" "wsdl" "wadl" "xml" "yaml")
  "List of supported file types.")

(defun counsel-ag-popup-read-file-types (prompt def history)
  "Prompt for Ag file type with PROMPT DEF HISTORY."
  (completing-read-multiple
   prompt
   counsel-ag-popup-file-type-list
   nil nil
   nil
   history
   def))

(defclass counsel-ag-popup-file-types (transient-infix) ()
  "Class used for the \"--\" argument.
All remaining arguments are treated as file types.
They become the value of this argument.")

(cl-defmethod transient-format-value ((obj counsel-ag-popup-file-types))
  "Format OBJ's value for display and return the result."
  (let ((argument (oref obj argument)))
    (if-let ((value (oref obj value)))
        (propertize (mapconcat (lambda (f) (concat argument f))
                               (oref obj value) " ")
                    'face 'transient-argument)
      (propertize argument 'face 'transient-inactive-argument))))

(cl-defmethod transient-init-value ((obj counsel-ag-popup-file-types))
  "Set the initial value of the object OBJ."
  (oset obj value
        (cdr (assoc "--" (oref transient--prefix value)))))

(cl-defmethod transient-infix-value ((obj counsel-ag-popup-file-types))
  "Return (concat ARGUMENT VALUE) or nil.

ARGUMENT and VALUE are the values of the respective slots of OBJ.
If VALUE is nil, then return nil.  VALUE may be the empty string,
which is not the same as nil."
  (when-let ((value (oref obj value)))
    (cons (oref obj argument) value)))

(defun counsel-ag-popup-read-pattern (prompt initial-input history)
  "Read a pattern from the minibuffer, prompting with string PROMPT.

If non-nil, second arg INITIAL-INPUT is a string to insert before reading.
The third arg HISTORY, if non-nil, specifies a history."
  (read-string prompt initial-input history))

(transient-define-argument counsel-ag-popup:-- ()
  "Restrict the search to certain types of files."
  :description "Limit to file types"
  :class 'counsel-ag-popup-file-types
  :key "--"
  :argument "--"
  :prompt "Limit to file type(s): "
  :multi-value t
  :reader #'counsel-ag-popup-read-file-types)

(transient-define-argument counsel-ag-popup:-A ()
  :description "Print lines after match"
  :class 'transient-option
  :shortarg "-A"
  :argument "--after="
  :reader 'transient-read-number-N+)

(transient-define-argument counsel-ag-popup:-B ()
  :description "Print lines before match"
  :class 'transient-option
  :shortarg "-B"
  :argument "--before="
  :reader 'transient-read-number-N+)

(transient-define-argument counsel-ag-popup:-C ()
  :description "Print lines before and after matches"
  :class 'transient-option
  :shortarg "-C"
  :argument "--context="
  :reader 'transient-read-number-N+)

(transient-define-argument counsel-ag-popup:=h ()
  :description "Search hidden files"
  :shortarg "=h"
  :argument "--hidden")

(transient-define-argument counsel-ag-popup:-f ()
  :description "Follow symlinks"
  :shortarg "-f"
  :argument "--follow")

(transient-define-argument counsel-ag-popup:-G ()
  :description "Limit search to filenames matching PATTERN"
  :class 'transient-option
  :shortarg "-G"
  :argument "--file-search-regex="
  :reader 'counsel-ag-popup-read-pattern)

(transient-define-argument counsel-ag-popup:-i ()
  :description "Match case insensitively"
  :shortarg "-i"
  :argument "--ignore-case")

(transient-define-argument counsel-ag-popup:-m ()
  :description "Skip the rest of a file after NUM matches"
  :class 'transient-option
  :shortarg "-m"
  :argument "--max-count="
  :reader 'transient-read-number-N+)

(transient-define-argument counsel-ag-popup:-Q ()
  :description "Don't parse PATTERN as a regular expression"
  :shortarg "-Q"
  :argument "--literal")

(transient-define-argument counsel-ag-popup:-s ()
  :description "Match case sensitively"
  :shortarg "-s"
  :argument "--case-sensitive")

(transient-define-argument counsel-ag-popup:-S ()
  :description "Match case insensitively unless PATTERN contains uppercase characters"
  :shortarg "-S"
  :argument "--smart-case")

(transient-define-argument counsel-ag-popup:-v ()
  :description "Invert match"
  :shortarg "-v"
  :argument "--invert-match")

(transient-define-argument counsel-ag-popup:-w ()
  :description "Only match whole words"
  :shortarg "-w"
  :argument "--word-regexp")

(defun counsel-ag-popup-search-here (&optional string)
  "Search using `counsel-ag' in the current directory for STRING."
  (interactive)
  (counsel-ag-popup-search default-directory string))

(defun counsel-ag-popup-search (directory &optional string)
  "Search using `counsel-ag' in a given DIRECTORY for STRING."
  (interactive "DDirectory: ")
  (let ((ag-args (counsel-ag-popup--map-args (transient-args 'counsel-ag-popup))))
    (counsel-ag string directory ag-args)))

(transient-define-prefix counsel-ag-popup ()
  "Search popup using `counsel-ag'."
  ["Output options"
   (counsel-ag-popup:-A)
   (counsel-ag-popup:-B)
   (counsel-ag-popup:-C)]
  ["Search options"
   (counsel-ag-popup:-f)
   (counsel-ag-popup:=h)
   (counsel-ag-popup:-G)
   (counsel-ag-popup:-i)
   (counsel-ag-popup:-m)
   (counsel-ag-popup:-Q)
   (counsel-ag-popup:-s)
   (counsel-ag-popup:-S)
   (counsel-ag-popup:-v)
   (counsel-ag-popup:-w)
   (counsel-ag-popup:--)]
  ["Search"
   ("s" "in current directory" counsel-ag-popup-search-here)
   ("o" "in other directory" counsel-ag-popup-search)])

(provide 'counsel-ag-popup)
;;; counsel-ag-popup.el ends here
