;;; lsp-ivy.el --- LSP ivy integration             -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Sebastian Sturm

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

;; Authors: Sebastian Sturm
;;          Oliver Rausch
;; Keywords: languages, debug
;; Package-Version: 20201113.2220
;; Package-Commit: c70ee8b54357c56d1b972393ee53e57a2e545fbb
;; URL: https://github.com/emacs-lsp/lsp-ivy
;; Package-Requires: ((emacs "25.1") (dash "2.14.1") (lsp-mode "6.2.1") (ivy "0.13.0"))
;; Version: 0.4
;;

;;; Commentary:

;; This package provides an interactive ivy interface to the workspace symbol
;; functionality offered by lsp-mode.  For an alternative implementation based on
;; helm, see https://github.com/emacs-lsp/helm-lsp

;;; Code:

(require 'ivy)
(require 'dash)

(require 'lsp-protocol)
(require 'lsp-mode)

(defgroup lsp-ivy nil
  "LSP support for ivy-based symbol completion"
  :group 'lsp-mode)

(defcustom lsp-ivy-show-symbol-kind
  t
  "Whether to show the symbol's kind when showing lsp symbols."
  :group 'lsp-ivy
  :type 'boolean)

(defcustom lsp-ivy-show-symbol-filename
  t
  "Whether to show the project-relative path to a symbol's point of definition."
  :group 'lsp-ivy
  :type 'boolean)

(defcustom lsp-ivy-filter-symbol-kind
  nil
  "A list of LSP SymbolKind's to filter out."
  :group 'lsp-ivy
  :type '(repeat integer))

(defcustom lsp-ivy-symbol-kind-to-face
  [("    " . nil)                           ; Unknown - 0
   ("File" . font-lock-builtin-face)        ; File - 1
   ("Modu" . font-lock-keyword-face)        ; Module - 2
   ("Nmsp" . font-lock-keyword-face)        ; Namespace - 3
   ("Pack" . font-lock-keyword-face)        ; Package - 4
   ("Clss" . font-lock-type-face)           ; Class - 5
   ("Meth" . font-lock-function-name-face)  ; Method - 6
   ("Prop" . font-lock-constant-face)       ; Property - 7
   ("Fld " . font-lock-constant-face)       ; Field - 8
   ("Cons" . font-lock-function-name-face)  ; Constructor - 9
   ("Enum" . font-lock-type-face)           ; Enum - 10
   ("Intf" . font-lock-type-face)           ; Interface - 11
   ("Func" . font-lock-function-name-face)  ; Function - 12
   ("Var " . font-lock-variable-name-face)  ; Variable - 13
   ("Cnst" . font-lock-constant-face)       ; Constant - 14
   ("Str " . font-lock-string-face)         ; String - 15
   ("Num " . font-lock-builtin-face)        ; Number - 16
   ("Bool " . font-lock-builtin-face)       ; Boolean - 17
   ("Arr " . font-lock-builtin-face)        ; Array - 18
   ("Obj " . font-lock-builtin-face)        ; Object - 19
   ("Key " . font-lock-constant-face)       ; Key - 20
   ("Null" . font-lock-builtin-face)        ; Null - 21
   ("EmMm" . font-lock-constant-face)       ; EnumMember - 22
   ("Srct" . font-lock-type-face)           ; Struct - 23
   ("Evnt" . font-lock-builtin-face)        ; Event - 24
   ("Op  " . font-lock-function-name-face)  ; Operator - 25
   ("TPar" . font-lock-type-face)]          ; TypeParameter - 26
  "A vector of 26 cons cells, where the ith cons cell contains the string representation and face to use for the i+1th SymbolKind (defined in the LSP)."
  :group 'lsp-ivy
  :type '(vector
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)
          (cons string face)))

(eval-when-compile
  (lsp-interface
   (lsp-ivy:FormattedSymbolInformation
    (:kind :name :location :textualRepresentation)
    (:containerName :deprecated))))

(lsp-defun lsp-ivy--workspace-symbol-action
  ((&SymbolInformation
    :location (&Location :uri :range (&Range :start (&Position :line :character)))))
  "Jump to selected candidate."
  (find-file (lsp--uri-to-path uri))
  (goto-char (point-min))
  (forward-line line)
  (forward-char character))

(lsp-defun lsp-ivy--format-symbol-match
  ((sym &as &SymbolInformation :kind :location (&Location :uri))
   project-root)
  "Convert the match returned by `lsp-mode` into a candidate string."
  (let* ((sanitized-kind (if (< kind (length lsp-ivy-symbol-kind-to-face)) kind 0))
         (type (elt lsp-ivy-symbol-kind-to-face sanitized-kind))
         (typestr (if lsp-ivy-show-symbol-kind
                      (propertize (format "[%s] " (car type)) 'face (cdr type))
                    ""))
         (pathstr (if lsp-ivy-show-symbol-filename
                      (propertize (format " · %s" (file-relative-name (lsp--uri-to-path uri) project-root))
                                  'face font-lock-comment-face) "")))
    (concat typestr (lsp-render-symbol-information sym ".") pathstr)))

(lsp-defun lsp-ivy--transform-candidate ((symbol-information &as &SymbolInformation :kind)
                                         filter-regexps? workspace-root)
  "Map candidate to nil if it should be excluded based on `lsp-ivy-filter-symbol-kind' or
FILTER-REGEXPS?, otherwise convert it to an `lsp-ivy:FormattedSymbolInformation' object."
  (unless (member kind lsp-ivy-filter-symbol-kind)
    (let ((textual-representation
           (lsp-ivy--format-symbol-match symbol-information workspace-root)))
      (when (--all? (string-match-p it textual-representation) filter-regexps?)
        (lsp-put symbol-information :textualRepresentation textual-representation)
        symbol-information))))

(defun lsp-ivy--workspace-symbol (workspaces prompt initial-input)
  "Search against WORKSPACES with PROMPT and INITIAL-INPUT."
  (let* ((prev-query nil)
         (unfiltered-candidates '())
         (filtered-candidates nil)
         (workspace-root (lsp-workspace-root))
         (update-candidates
          (lambda (all-candidates filter-regexps?)
            (setq filtered-candidates
                  (--keep (lsp-ivy--transform-candidate it filter-regexps? workspace-root)
                          all-candidates))
            (ivy-update-candidates filtered-candidates))))
    (ivy-read
     prompt
     (lambda (user-input)
       (let* ((parts (split-string user-input))
              (query (or (car parts) ""))
              (filter-regexps? (mapcar #'regexp-quote (cdr parts))))
         (when query
           (if (string-equal prev-query query)
               (funcall update-candidates unfiltered-candidates filter-regexps?)
             (with-lsp-workspaces workspaces
               (lsp-request-async
                "workspace/symbol"
                (lsp-make-workspace-symbol-params :query query)
                (lambda (result)
                  (setq unfiltered-candidates result)
                  (funcall update-candidates unfiltered-candidates filter-regexps?))
                :mode 'detached
                :cancel-token :workspace-symbol))))
         (setq prev-query query))
       (or filtered-candidates 0))
     :dynamic-collection t
     :require-match t
     :initial-input initial-input
     :action #'lsp-ivy--workspace-symbol-action
     :caller 'lsp-ivy-workspace-symbol)))

(ivy-configure 'lsp-ivy-workspace-symbol
  :display-transformer-fn
  (-lambda ((&lsp-ivy:FormattedSymbolInformation :textual-representation))
    textual-representation))

;;;###autoload
(defun lsp-ivy-workspace-symbol (arg)
  "`ivy' for lsp workspace/symbol.
When called with prefix ARG the default selection will be symbol at point."
  (interactive "P")
  (lsp-ivy--workspace-symbol (lsp-workspaces)
                             "Workspace symbol: "
                             (when arg (thing-at-point 'symbol))))

;;;###autoload
(defun lsp-ivy-global-workspace-symbol (arg)
  "`ivy' for lsp workspace/symbol for all of the current workspaces.
When called with prefix ARG the default selection will be symbol at point."
  (interactive "P")
  (lsp-ivy--workspace-symbol
   (-uniq (-flatten (ht-values (lsp-session-folder->servers (lsp-session)))))
   "Global workspace symbols: "
   (when arg (thing-at-point 'symbol))))

(provide 'lsp-ivy)
;;; lsp-ivy.el ends here
