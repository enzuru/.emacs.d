;;; fish-mode.el --- Major mode for fish shell scripts  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Tony Wang

;; Author: Tony Wang <wwwjfy@gmail.com>
;; Keywords: Fish, shell
;; Package-Version: 20200213.2137
;; Package-Requires: ((emacs "24"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A very basic version of major mode for fish shell scripts.
;; Current features:
;;
;;  - keyword highlight
;;  - basic indent
;;  - comment detection
;;  - run fish_indent for indention
;;
;;  To run fish_indent before save, add the following to init script:
;;  (add-hook 'fish-mode-hook (lambda ()
;;                              (add-hook 'before-save-hook 'fish_indent-before-save)))
;;
;;  Configuration:
;;  fish-indent-offset: customize the indentation

;;; Code:

(require 'cl-lib)
(eval-when-compile (require 'subr-x))

(defgroup fish nil
  "Fish shell support."
  :group 'languages)

(defcustom fish-indent-offset 4
  "Default indentation offset for Fish."
  :group 'fish
  :type 'integer
  :safe 'integerp)

(defvar fish-enable-auto-indent nil
  "Controls auto-indent feature.
If the value of this variable is non-nil, whenever a word in
`fish-auto-indent-trigger-keywords' is typed, it is indented instantly.")

(unless (fboundp 'setq-local)
  (defmacro setq-local (var val)
    "Set variable VAR to value VAL in current buffer."
    `(set (make-local-variable ',var) ,val)))

;;; Syntax highlighting
(defconst fish-builtins
  (list
   "alias"
   "argparse"
   "bg"
   "bind"
   "block"
   "breakpoint"
   "builtin"
   "cd"
   "commandline"
   "command"
   "complete"
   "contains"
   "count"
   "dirh"
   "dirs"
   "disown"
   "echo"
   "emit"
   "exec"
   "fg"
   "fish_config"
   "fishd"
   "fish_indent"
   "fish_pager"
   "fish_prompt"
   "fish_right_prompt"
   "fish"
   "fish_update_completions"
   "funced"
   "funcsave"
   "functions"
   "help"
   "history"
   "isatty"
   "jobs"
   "math"
   "mimedb"
   "nextd"
   "open"
   "popd"
   "prevd"
   "printf"
   "psub"
   "pushd"
   "pwd"
   "random"
   "read"
   "realpath"
   "set_color"
   "source"
   "status"
   "string"
   "trap"
   "type"
   "ulimit"
   "umask"
   "vared"
   ))
(defconst fish-keywords
  (list
   "&&"
   "||"
   "and"
   "begin"
   "break"
   "case"
   "continue"
   "else"
   "end"
   "eval"
   "exit"
   "false"
   "for"
   "function"
   "if"
   "or"
   "return"
   "set"
   "switch"
   "test"
   "true"
   "while"
   ))
(defconst fish-font-lock-keywords-1
  (list

   ;; Builtins
   `( ,(rx-to-string `(and
                       symbol-start
                       (eval `(or ,@fish-builtins))
                       symbol-end)
                     t)
      .
      font-lock-builtin-face)

   ;; Keywords
   `( ,(rx-to-string `(and
                       symbol-start
                       (eval `(or ,@fish-keywords))
                       symbol-end)
                     t)
      .
      font-lock-keyword-face)

   ;; Backslashes

   ;; This doesn't highlight backslashes inside strings.  I guess this
   ;; is a limitation of using the regexp-based syntax highlighting.
   ;; Also, using `(rx (symbol escape))' doesn't match them, even
   ;; though I tried adding backslashes to the syntax table as escape
   ;; chars.
   `( ,(rx
        "\\")
      .
      font-lock-negation-char-face)

   ;; Function definitions

   ;; Using form:
   ;;
   ;; (MATCHER MATCH-HIGHLIGHT MATCH-ANCHORED)
   ;;
   ;; The help for "font-lock-keywords" seems to have an error in
   ;; which it would mean to use the form "(MATCHER MATCH-ANCHORED)",
   ;; which would leave off the MATCH-HIGHLIGHT for the first MATCHER.
   ;; However, the example in the help shows the correct form, which
   ;; is used here.

   ;; It would be nice to highlight less-important options like
   ;; "description" differently than important ones like "on-event",
   ;; but I haven't been able to get it working. If I divide the
   ;; options into two groups, each group is only matched in order
   ;; (i.e. if an option in the second group appears before an option
   ;; in the first group, it doesn't match at all). The help for
   ;; font-lock-keywords doesn't mention anything about matching
   ;; subsequent MATCH-ANCHORED expressions in order, but it appears
   ;; to do so.
   `( ,(rx symbol-start
           "function"
           (1+ space)
           ;; Function name
           (group (1+ (or alnum (syntax symbol))))
           symbol-end)
      (1 font-lock-function-name-face)
      ;; Function options
      (,(rx (group symbol-start
                   (repeat 1 2 "-")
                   (1+ (or alnum (syntax symbol)))
                   symbol-end))
       nil nil
       (1 font-lock-negation-char-face)))

   ;; Variable definition
   `( ,(rx
        symbol-start
        "set"
        (1+ space)
        (optional "-" (repeat 1 2 letter) (1+ space))
        (group (1+ (or alnum (syntax symbol)))))
      1
      font-lock-variable-name-face)

   ;; For loops
   `( ,(rx
        ;; Beginning of command or line
        (or line-start
            ";")
        (0+ space)
        ;; "for" keyword
        "for"
        (1+ space)
        ;; variable name
        (group (1+ (or alnum
                       (syntax symbol))))
        (1+ space)
        ;; "in"
        (group "in")
        (1+ space)
        ;; list
        (group (or
                ;; plain list
                (1+ (or alnum
                        (syntax symbol)
                        space))
                ;; process substitution
                (and
                 (syntax open-parenthesis)
                 (+? anything)
                 (syntax close-parenthesis)))))
      (1 font-lock-variable-name-face)
      (2 font-lock-keyword-face)
      (3 font-lock-string-face t))

   ;; Variable substitution
   `( ,(rx
        (group "$") (group (1+ (or alnum (syntax symbol)))) symbol-end)
      (1 font-lock-string-face)
      (2 font-lock-variable-name-face))

   ;; Negation
   `( ,(rx symbol-start
           (or (and (group "not")
                    symbol-end)))
      1
      font-lock-negation-char-face)

   ;; "set" options
   `( ,(rx symbol-start (and "set"
                             (1+ space)
                             (group (and "-" (repeat 1 2 letter)))
                             (1+ space)))
      1
      font-lock-negation-char-face)

   ;; Process substitution
   `( ,(rx
        (1+ space)
        (syntax open-parenthesis)
        ;; command name
        (group (1+ (or alnum (syntax symbol))))
        (0+ not-newline)
        (syntax close-parenthesis))
      1
      ;; It would be nice to use the sh-quoted-exec face, but it's only
      ;; available in sh-mode
      font-lock-builtin-face)

   ;; Important characters
   `( ,(rx symbol-start
           (or (any "|&")
               (syntax escape))
           )
      .
      font-lock-negation-char-face)

   ;; Redirection
   `( ,(rx
        (1+ space)
        (group
         (any "><^")
         (optional "&")
         (optional (1+ space))
         (1+ (not (any space)))))
      .
      font-lock-negation-char-face)

   ;; Command name
   `( ,(rx-to-string
        `(and
          (or line-start  ;; new line
              ";" ;; new command
              "&"  ;; background
              "|") ;; pipe
          (0+ space)
          (optional (eval `(or ,@fish-keywords))
                    (1+ space))
          (group (1+ (or alnum (syntax symbol))))
          symbol-end)
        t)
      1
      font-lock-builtin-face)

   ;; Numbers
   `( ,(rx symbol-start (optional "-")(1+ (or digit (char ?.))) symbol-end)
      .
      font-lock-constant-face)))

(defvar fish-mode-syntax-table
  (let ((tab (make-syntax-table text-mode-syntax-table)))
    (modify-syntax-entry ?\# "<" tab)
    (modify-syntax-entry ?\n ">" tab)
    (modify-syntax-entry ?\" "\"\"" tab)
    (modify-syntax-entry ?\' "\"'" tab)
    (modify-syntax-entry ?\\ "\\" tab)
    (modify-syntax-entry ?$ "'" tab)
    tab)
  "Syntax table for `fish-mode'.")

(defvar fish-auto-indent-trigger-keywords
  '("end"
    "else"
    "case")
  "Keywords that should trigger auto-indent.")

(defvar fish/auto-indent-trigger-events
  (let ((trigger-letters
         (mapcar (lambda (x)
                   (substring x -1 nil))
                 fish-auto-indent-trigger-keywords)))
    (listify-key-sequence
     (string-join (delete-dups trigger-letters))))
  "List of key events that should trigger auto-indent.")

(defvar fish/auto-indent-trigger-regexps
  (mapcar (lambda (x)
            (concat "[ \t]*" x "\\>"))
          fish-auto-indent-trigger-keywords)
  "List of regexps used to determine whether or not to trigger auto-indent.")

;;; Indentation helpers

(defvar fish/block-opening-terms-re
  (rx symbol-start
      (or "if"
          "function"
          "while"
          "for"
          "begin"
          "switch")
      symbol-end)
  "Regular expression matching block opening terms.")

(defun fish/current-line ()
  "Return the line at point as a string."
  (buffer-substring (line-beginning-position) (line-end-position)))

(defun fish/fold (f x list)
  "Recursively applies (F i j) to LIST starting with X.
For example, (fold F X '(1 2 3)) computes (F (F (F X 1) 2) 3)."
  (let ((li list) (x2 x))
    (while li
      (setq x2 (funcall f x2 (pop li))))
    x2))

(defun fish/count-tokens-on-current-line (positive-re &optional negative-re)
  "Return count of matches for POSITIVE-RE that do not also match NEGATIVE-RE on current line.
POSITIVE-RE and NEGATIVE-RE are regular expressions."
  (cl-flet ((count-matches (re)
                           (save-excursion
                             (cl-loop initially (goto-char (line-beginning-position))
                                      while (re-search-forward re (line-end-position) t)
                                      for syntax = (syntax-ppss)
                                      count (not (or
                                                  ;; String
                                                  (nth 3 syntax)
                                                  ;; Comment
                                                  (nth 4 syntax)))))))
    (let ((positive-count (count-matches positive-re))
          (negative-count (when negative-re
                            (count-matches negative-re))))
      (if negative-re
          (- positive-count negative-count)
        positive-count))))

(defun fish/at-comment-line? ()
  "Returns t if looking at comment line, nil otherwise."
  (looking-at "[ \t]*#"))

(defun fish/at-empty-line? ()
  "Returns t if looking at empty line, nil otherwise."
  (looking-at "[ \t]*$"))

(defun fish/count-of-opening-terms ()
  (fish/count-tokens-on-current-line fish/block-opening-terms-re
                                     (rx symbol-start "else if" symbol-end)))

(defun fish/count-of-end-terms ()
  (fish/count-tokens-on-current-line (rx symbol-start "end" symbol-end) nil))

(defun fish/at-open-block? ()
  "Returns t if line contains block opening term
   that is not closed in the same line, nil otherwise."
  (> (fish/count-of-opening-terms)
     (fish/count-of-end-terms)))

(defun fish/at-open-end? ()
  "Returns t if line contains 'end' term and
   doesn't contain block opening term that matches
   this 'end' term. Returns nil otherwise."
  (> (fish/count-of-end-terms)
     (fish/count-of-opening-terms)))

(defun fish/line-contains-open-switch-term? ()
  "Returns t if line contains switch term, nil otherwise."
  (> (fish/count-tokens-on-current-line (rx symbol-start "switch" symbol-end) nil)
     (fish/count-of-end-terms)))

;;; Indentation

(defun fish-indent-line ()
  "Indent current line."
  ;; start calculating indentation level
  (let ((cur-indent 0)      ; indentation level for current line
        (rpos (- (point-max)
                 (point)))) ; used to move point after indentation :: todo - check if it's possible to avoid this variable
    (save-excursion
      ;; go to beginning of line
      (beginning-of-line)
      ;; check if already at the beginning of buffer
      (unless (bobp)
        (cond
         ;; found comment line
         ;; cur-indent is based on previous non-empty and non-comment line
         ;; todo - answer why we can't move it to default case
         ((fish/at-comment-line?)
          (setq cur-indent (fish-get-normal-indent)))

         ;; found line that starts with 'end'
         ;; this is a special case
         ;; so get indentation level
         ;; from 'fish-get-end-indent function
         ((looking-at "[ \t]*end\\>")
          (setq cur-indent (fish-get-end-indent)))

         ;; found line that stats with 'case'
         ;; this is a special case
         ;; so get indentation level
         ;; from 'fish-get-case-indent
         ((looking-at "[ \t]*case\\>")
          (setq cur-indent (fish-get-case-indent)))

         ;; found line that starts with 'else'
         ;; cur-indent is previous non-empty and non-comment line
         ;; minus fish-indent-offset
         ((looking-at "[ \t]*else\\>")
          (setq cur-indent (- (fish-get-normal-indent) fish-indent-offset)))

         ;; default case
         ;; cur-indent equals to indentation level of previous
         ;; non-empty and non-comment line
         (t (setq cur-indent (fish-get-normal-indent))))))

    ;; before indenting check cur-indent for negative level
    (if (< cur-indent 0) (setq cur-indent 0))

    ;; indent current line
    (indent-line-to cur-indent)

    ;; shift point to respect previous position
    (if (> (- (point-max) rpos) (point))
        (goto-char (- (point-max) rpos)))))

(defun fish-get-normal-indent ()
  "Returns indentation level based on previous non-empty and non-comment line."
  (catch :indent
    (cl-labels ((back-to-non-continued
                 () (cl-loop do (forward-line -1)
                             while (line-continued-p)))
                (line-continued-p
                 () (save-excursion
                      (forward-line -1)
                      (looking-at-p (rx (1+ nonl) "\\" eol)))))
      (while (not (bobp))
        (if (line-continued-p)
            ;;  Line is continued: return indentation of previous
            ;;  non-continued line.
            (progn
              (back-to-non-continued)
              (throw :indent (+ (current-indentation) fish-indent-offset)))
          ;; Line is not continued.  Get indentation from previous lines.

          ;; NOTE: Move to previous line.  The rest of this loop
          ;; refers to the previous line, not the one whose
          ;; indentation is being returned.
          (forward-line -1)

          (cond
           ((line-continued-p)
            ;;  Return indentation of previous non-continued line.
            (back-to-non-continued)
            (throw :indent (current-indentation)))

           ((fish/at-empty-line?)
            ;; Return indentation of previous non-continued line.
            (back-to-non-continued)
            (throw :indent (current-indentation)))

           ((fish/at-comment-line?)
            ;;  Return current indentation.
            (throw :indent (current-indentation)))

           ((fish/at-open-block?)
            ;; Return one-deeper level of indentation.
            (throw :indent (+ (current-indentation) fish-indent-offset)))

           ((looking-at-p "[ \t]*\\(else\\|case\\)\\>")
            ;; Return one-deeper level of indentation.
            (throw :indent (+ (current-indentation) fish-indent-offset)))

           ((looking-at-p "[ \t]*end\\>")
            ;; Closing block: return current indentation.
            (throw :indent (current-indentation)))

           ;; found a line that contains open 'end' term
           ;; and doesn't start with 'end' (the order matters!)
           ;; it means that this 'end' is indented to the right
           ;; so we need to decrease indentation level
           ((fish/at-open-end?)
            (throw :indent (- (current-indentation) fish-indent-offset)))

           (t
            ;;  Return current indentation.
            (throw :indent (current-indentation)))))))))

(defun fish-get-end-indent ()
  "Returns indentation level based on matching block opening term."
  (let ((cur-indent 0)
        (count-of-ends 1))
    (while (not (or (eq count-of-ends 0)
                    (bobp)))

      ;; move to previous line
      (forward-line -1)

      (cond
       ;; found empty line, so just skip it
       ((fish/at-empty-line?))

       ;; found comment line, so just skip it
       ((fish/at-comment-line?))

       ;; we found the line that contains unmatched
       ;; block opening term so decrease the count of end terms
       ((fish/at-open-block?)
        (setq count-of-ends (- count-of-ends 1))
        ;; when count of end terms is zero
        ;; it means that we found matching term that
        ;; opens block
        ;; so cur-indent equals to inden equals to
        ;; indentation level of current line
        (when (eq count-of-ends 0)
          (setq cur-indent (current-indentation))))

       ;; we found new end term
       ;; so just increase the count of end terms
       ((fish/at-open-end?)
        (setq count-of-ends (+ count-of-ends 1)))

       ;; do nothing
       (t)))

    ;; it means that we didn't found a matching pair
    ;; for 'end' term
    (unless (eq count-of-ends 0)
      (error "Found unmatched 'end' term."))

    cur-indent))

(defun fish-get-case-indent ()
  "Returns indentation level based on matching 'switch' term."
  (let ((cur-indent 0)
        (not-indented t)
        (count-of-ends 0))
    (while (and not-indented
                (not (bobp)))
      ;; move to previous line
      (forward-line -1)

      (cond
       ;; found empty line, so just skip it
       ((fish/at-empty-line?))

       ;; found comment line, so just skip it
       ((fish/at-comment-line?))

       ;; the following two conditions are to check embeded switch term
       ((and
         (> (fish/count-of-opening-terms) 0)
         (> count-of-ends 0))
        (setq count-of-ends (1- count-of-ends)))

       ((fish/at-open-end?)
        (setq count-of-ends (1+ count-of-ends)))


       ;; line contains switch term
       ;; so cur-indent equals to increased
       ;; indentation level of current line
       ((fish/line-contains-open-switch-term?)
        (setq cur-indent (+ (current-indentation) fish-indent-offset)
              not-indented nil))

       ;; do nothing
       (t)))

    ;; it means that we didn't find a matching pair
    (when not-indented
      (error "Found 'case' term without matching 'switch' term"))

    cur-indent))

(defun fish/auto-indent ()
  "Auto-indent when a word in FISH-AUTO-INDENT-TRIGGER-KEYWORDS is typed."
  ;; check last-command-event first because it's less expensive than
  ;; string-match
  (when (member last-command-event fish/auto-indent-trigger-events)
    ;; next check whether the line matches a regexp in
    ;; fish/auto-indent-trigger-regexps
    (when (cl-some (lambda (x)
                  (string-match x (thing-at-point 'line)))
                fish/auto-indent-trigger-regexps)
      (fish-indent-line)
      (fish/auto-indent-post-indent-check (line-number-at-pos)))))

(defun fish/auto-indent-post-indent-check (line-num)
  "Handle next key event after auto-indenting by re-indenting if we're still on line LINE-NUM."
  (add-hook 'post-self-insert-hook
            (defun fish/post-auto-indent ()
              (when (= (line-number-at-pos) line-num)
                (fish-indent-line))
              (remove-hook 'post-self-insert-hook
                           'fish/post-auto-indent))
            nil t))

;;; fish_indent
(defun fish_indent ()
  "Indent current buffer using fish_indent"
  (interactive)
  (let ((current-point (point)))
    (call-process-region (point-min) (point-max) "fish_indent" t t nil)
    (goto-char current-point)
    ))

;;; Mode definition

;;;###autoload
(defun fish_indent-before-save ()
  (interactive)
  (when (eq major-mode 'fish-mode) (fish_indent)))

;;;###autoload
(define-derived-mode fish-mode prog-mode "Fish"
  "Major mode for editing fish shell files."
  :syntax-table fish-mode-syntax-table
  (setq-local indent-line-function 'fish-indent-line)
  (setq-local font-lock-defaults '(fish-font-lock-keywords-1))
  (setq-local comment-start "# ")
  (setq-local comment-start-skip "#+[\t ]*")
  (when fish-enable-auto-indent
    (add-hook 'post-self-insert-hook 'fish/auto-indent nil t)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))
;;;###autoload
(add-to-list 'auto-mode-alist '("/fish_funced\\..*\\'" . fish-mode))
;;;###autoload
(add-to-list 'interpreter-mode-alist '("fish" . fish-mode))

(provide 'fish-mode)

;;; fish-mode.el ends here
