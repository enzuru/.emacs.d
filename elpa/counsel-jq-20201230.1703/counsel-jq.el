;;; counsel-jq.el --- Live preview of "jq" queries using counsel -*- lexical-binding: t -*-
;;; Version: 1.0.0
;; Package-Version: 20201230.1703
;; Package-Commit: 153d70b576df1d572c56d84039cb40749310cfe7
;;; Author: Alain M. Lafon <alain@200ok.ch)
;;; Package-Requires: ((swiper "0.12.0") (ivy "0.12.0") (emacs "24.1"))
;;; Keywords: convenience, data, matching
;;; URL: https://github.com/200ok-ch/counsel-jq
;;; Commentary:
;;;   Needs the "jq" binary installed.
;;; Code:

(require 'swiper)

(defcustom counsel-jq-json-buffer-mode 'js-mode
  "Major mode for the resulting *jq-json* buffer."
  :type '(function)
  :require 'counsel-jq
  :group 'counsel-jq)

(defun counsel-jq-json (&optional query)
  "Call 'jq' with the QUERY with a default of '.'."
  (with-current-buffer
      ;; The user entered the `counsel-jq` query in the minibuffer.
      ;; This expression uses the most recent buffer ivy-read was
      ;; invoked from.
      (ivy-state-buffer ivy-last)
    (call-process-region
     (point-min)
     (point-max)
     "jq"
     nil
     "*jq-json*"
     nil
     "-M"
     (or query "."))))

(defun counsel-jq-query-function (input)
  "Wrapper function passing INPUT over to `counsel-jq-json'."
  (when (get-buffer "*jq-json*")
      (with-current-buffer "*jq-json*"
        (funcall counsel-jq-json-buffer-mode)
        (erase-buffer)))
  (counsel-jq-json input)
  (split-string
   (with-current-buffer "*jq-json*"
     (buffer-string))  "\n"))

;;;###autoload
(defun counsel-jq ()
  "Counsel interface for dynamically querying jq. Whenever you're happy with the query, hit RET and the results will be displayed to you in the buffer *jq-json*."
  (interactive)
  (ivy-read "jq query: " #'counsel-jq-query-function
            :action #'(1
                      ("s" (lambda (x)
                             (split-window-below)
                             (switch-to-buffer "*jq-json*"))
                             "show"))
            :initial-input "."
            :dynamic-collection t
            :caller 'counsel-jq))


(provide 'counsel-jq)

;;; counsel-jq.el ends here
