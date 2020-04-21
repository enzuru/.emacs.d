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
;; Package-Version: 20200418.1500
;; URL: https://github.com/emacs-lsp/lsp-ivy
;; Package-Requires: ((emacs "25.1") (dash "2.14.1") (lsp-mode "6.2.1") (ivy "0.13.0"))
;; Version: 0.3
;;

;;; Commentary:

;; This package provides an interactive ivy interface to the workspace symbol
;; functionality offered by lsp-mode. For an alternative implementation based on
;; helm, see https://github.com/emacs-lsp/helm-lsp

;;; Code:

(require 'ivy)
(require 'dash)
(require 'lsp-mode)

(defgroup lsp-ivy nil
  "LSP support for ivy-based symbol completion"
  :group 'lsp-mode)

(defcustom lsp-ivy-show-symbol-kind
  t
  "Whether to show the symbol's kind when showing lsp symbols"
  :group 'lsp-ivy
  :type 'boolean)

(defcustom lsp-ivy-filter-symbol-kind
  nil
  "A list of LSP SymbolKind's to filter out"
  :group 'lsp-ivy
  :type '(repeat integer))

(defcustom lsp-ivy-symbol-kind-to-face
  [("    " . nil)                           ;; Unknown - 0
   ("File" . font-lock-builtin-face)       ;; File - 1
   ("Modu" . font-lock-keyword-face)       ;; Module - 2
   ("Nmsp" . font-lock-keyword-face)       ;; Namespace - 3
   ("Pack" . font-lock-keyword-face)       ;; Package - 4
   ("Clss" . font-lock-type-face)          ;; Class - 5
   ("Meth" . font-lock-function-name-face) ;; Method - 6
   ("Prop" . font-lock-reference-face)     ;; Property - 7
   ("Fld " . font-lock-reference-face)     ;; Field - 8
   ("Cons" . font-lock-function-name-face) ;; Constructor - 9
   ("Enum" . font-lock-type-face)          ;; Enum - 10
   ("Intf" . font-lock-type-face)          ;; Interface - 11
   ("Func" . font-lock-function-name-face) ;; Function - 12
   ("Var " . font-lock-variable-name-face) ;; Variable - 13
   ("Cnst" . font-lock-constant-face)      ;; Constant - 14
   ("Str " . font-lock-string-face)        ;; String - 15
   ("Num " . font-lock-builtin-face)       ;; Number - 16
   ("Bool " . font-lock-builtin-face)      ;; Boolean - 17
   ("Arr " . font-lock-builtin-face)       ;; Array - 18
   ("Obj " . font-lock-builtin-face)       ;; Object - 19
   ("Key " . font-lock-reference-face)     ;; Key - 20
   ("Null" . font-lock-builtin-face)       ;; Null - 21
   ("EmMm" . font-lock-constant-face)      ;; EnumMember - 22
   ("Srct" . font-lock-type-face)          ;; Struct - 23
   ("Evnt" . font-lock-builtin-face)       ;; Event - 24
   ("Op  " . font-lock-function-name-face) ;; Operator - 25
   ("TPar" . font-lock-type-face)]         ;; TypeParameter - 26
  "A vector of 26 cons cells, where the ith cons cell contains the string representation and face to use for the i+1th SymbolKind (defined in the LSP)"
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


(defun lsp-ivy--format-symbol-match (match)
  "Convert the MATCH returned by `lsp-mode` into a candidate string.
MATCH is a cons cell whose cdr is the hash-table from `lsp-mode`."
  (let* ((match (cdr match))
         (container-name (gethash "containerName" match))
         (name (gethash "name" match))
         (type (elt lsp-ivy-symbol-kind-to-face (gethash "kind" match) ))
         (typestr (if lsp-ivy-show-symbol-kind
                      (propertize (format "[%s] " (car type)) 'face (cdr type))
                    "")))
    (concat typestr (if (or (null container-name) (string-empty-p container-name))
                        (format "%s" name)
                      (format "%s.%s" container-name name)))))

(defun lsp-ivy--workspace-symbol-action (candidate)
  "Jump to selected CANDIDATE, a cons cell whose cdr is a hash table."
  (-let* ((candidate (cdr candidate))
          ((&hash "uri" "range" (&hash "start" (&hash "line" "character")))
           (gethash "location" candidate)))
    (find-file (lsp--uri-to-path uri))
    (goto-char (point-min))
    (forward-line line)
    (forward-char character)))

(defun lsp-ivy--filter-func (candidate)
  (member (gethash "kind" candidate) lsp-ivy-filter-symbol-kind))

(defun lsp-ivy--workspace-symbol (workspaces prompt initial-input)
  "Search against WORKSPACES with PROMPT and INITIAL-INPUT."
  (ivy-read
   prompt
   (lambda (user-input)
     (with-lsp-workspaces workspaces
       (lsp-request-async
        "workspace/symbol"
        (list :query user-input)
        (lambda (result)
          (ivy-update-candidates
           (mapcar
            (lambda (data)
              (cons (gethash "name" data) data))
            (-remove 'lsp-ivy--filter-func result))))
        :mode 'detached
        :cancel-token :workspace-symbol))
     0)
   :dynamic-collection t
   :require-match t
   :initial-input initial-input
   :action #'lsp-ivy--workspace-symbol-action
   :caller 'lsp-ivy-workspace-symbol))

(ivy-configure 'lsp-ivy-workspace-symbol
  :display-transformer-fn #'lsp-ivy--format-symbol-match)

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
