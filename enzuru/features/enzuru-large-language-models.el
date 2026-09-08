;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-agent-shell-new-shell ()
  "Split the window and start a new agent shell in the split."
  (interactive)
  (split-window-vertically)
  (agent-shell-new-shell))

(defun enzuru-configure-agent-shell ()
  (setq agent-shell-permission-responder-function
        #'agent-shell-permission-allow-always)
  (setq agent-shell-anthropic-default-session-mode-id "auto")
  (setq agent-shell-preferred-agent-config 'claude-code))

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

(defun enzuru-project-tab-status (root)
  "Show ROOT in the selected window and return its buffer.

Use Magit when ROOT is a git repo, and Dired otherwise."
  (if (and (fboundp 'magit-status-setup-buffer)
           (eq 'Git (vc-responsible-backend root t)))
      (let ((magit-display-buffer-function
             #'magit-display-buffer-same-window-except-diff-v1))
        (magit-status-setup-buffer root))
    (dired root)))

(defun enzuru-project-tab (directory)
  "Switch to the tab dedicated to the project in DIRECTORY.

The tab is named after the project.  The first visit creates the tab
with two windows side by side: the project status on the left and the
project's agent shell on the right.  Later visits reuse the tab, its
windows and its shell.

Interactively, prompt for a known project."
  (interactive (progn (require 'project)
                      (list (funcall project-prompter))))
  (let* ((project (project-current nil directory))
         (root (project-root project))
         (name (project-name project))
         (fresh (not (enzuru-tab-exists-p name))))
    (project-remember-project project)
    (tab-bar-switch-to-tab name)
    (when fresh
      (delete-other-windows)
      (let* ((status-buffer (enzuru-project-tab-status root))
             (shell-window (split-window-right))
             (shell-buffer (with-current-buffer status-buffer
                             (agent-shell--shell-buffer))))
        (set-window-buffer shell-window shell-buffer)
        (select-window shell-window)))))

(defun enzuru-configure-project-tabs ()
  (define-key project-prefix-map "a" #'enzuru-project-tab)
  (add-to-list 'project-switch-commands
               '(enzuru-project-tab "Agent tab" "a") t))

(global-set-key (kbd "C-c P") #'enzuru-project-tab)

(with-eval-after-load 'project (enzuru-configure-project-tabs))

;; Packages

(use-package agent-shell
  :ensure t
  :demand t
  :bind (("C-c A" . enzuru-agent-shell-new-shell))
  :config (enzuru-configure-agent-shell))

(provide 'enzuru-large-language-models)

;;; enzuru-large-language-models.el ends here
