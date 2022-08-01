;;; company-aspell.el --- company-mode completion backend using Aspell

;; Author: Ahmed Khanzada

;;; Commentary:
;;

;;; Code:

(require 'company)
(require 'cl-lib)

(defgroup company-aspell nil
  "Completion backend using Aspell."
  :group 'company)

(defun company-aspell--lookup-words (word &optional lookup-dict)
  (message word)
  (let* ((aspell-command
          (concat "echo '" word "' | aspell -a"))
         (results
          (split-string (shell-command-to-string aspell-command) ",")))
    (setf (nth 0 results)
          (nth 0
               (last (split-string (nth 0 results) " "))))
    (let ((trimmed-results
           (cl-map 'list 'string-trim results)))
      (print trimmed-results)
      trimmed-results)))

;;;###autoload
(defun company-aspell (command &optional arg &rest ignored)
  "company-mode completion backend using Aspell."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-aspell))
    (prefix (when t (company-grab-symbol)))
    (candidates (company-aspell--lookup-words arg))
    (kind 'text)
    (sorted t)))

(provide 'company-aspell)
