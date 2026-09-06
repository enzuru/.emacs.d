;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(use-package agent-shell
  :ensure t
  :defer t)

(defun enzuru-agent-shell-language ()
  "Return the current major mode as a markdown code fence language."
  (string-remove-suffix
   "-ts" (string-remove-suffix "-mode" (symbol-name major-mode))))

(defun enzuru-agent-shell-region-text (start end)
  "Format the text between START and END as a referenced code block."
  (format "%s\n\n```%s\n%s\n```"
          (if buffer-file-name
              (format "%s:%d-%d"
                      buffer-file-name
                      (line-number-at-pos start)
                      (line-number-at-pos end))
            (buffer-name))
          (enzuru-agent-shell-language)
          (buffer-substring-no-properties start end)))

(cl-defun enzuru-agent-shell-send (&key note start end (submit t) no-focus pick-shell)
  "Send NOTE and the region between START and END to an agent shell.

NOTE is prose placed above the code, usually an instruction.  START
and END default to the active region, and may be omitted to send NOTE
on its own.  Either may be omitted, but not both.

SUBMIT, unless nil, sends the prompt rather than leaving it waiting.
NO-FOCUS, when non-nil, leaves point in the current buffer.
PICK-SHELL, when non-nil, prompts for which shell to send to instead
of using the current project's.

Interactively, prompt for NOTE, send the active region if there is
one, and with a prefix argument prompt for the shell."
  (interactive
   (list :start (when (use-region-p) (region-beginning))
         :end (when (use-region-p) (region-end))
         :note (read-string "Note: ")
         :pick-shell current-prefix-arg))
  (let* ((start (or start (when (use-region-p) (region-beginning))))
         (end (or end (when (use-region-p) (region-end))))
         (text (string-join
                (seq-remove #'string-empty-p
                            (list (string-trim (or note ""))
                                  (if (and start end)
                                      (enzuru-agent-shell-region-text start end)
                                    "")))
                "\n\n"))
         (shell-buffer (if pick-shell
                           (get-buffer
                            (completing-read
                             "Send to shell: "
                             (mapcar #'buffer-name
                                     (or (agent-shell-buffers)
                                         (user-error "No agent shells available")))
                             nil t))
                         (agent-shell--shell-buffer))))
    (when (string-empty-p text)
      (user-error "Nothing to send"))
    (deactivate-mark)
    (agent-shell-insert :text text
                        :submit submit
                        :no-focus no-focus
                        :shell-buffer shell-buffer)))

(defun enzuru-explain-region (start end)
  "Ask the agent shell to explain the code between START and END."
  (interactive "r")
  (enzuru-agent-shell-send
   :note "Explain what this code does."
   :start start
   :end end))

(defun enzuru-configure-efrit ()
  (let ((default-directory "~/.emacs.d/elpaca/repos/efrit/lisp"))
    (add-to-list 'load-path default-directory)
    (normal-top-level-add-subdirs-to-load-path))
  (require 'efrit))

;; (use-package efrit
;;   :ensure (:type git :host github :repo "riwatt/efrit")
;;   :config (enzuru-configure-efrit))

(provide 'enzuru-large-language-models)

;;; enzuru-large-language-models.el ends here
