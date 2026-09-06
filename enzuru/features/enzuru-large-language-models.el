;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(use-package agent-shell
  :ensure t
  :defer t)

(defun enzuru-explain-region (start end)
  "Ask the agent shell to explain the code between START and END."
  (interactive "r")
  (require 'agent-shell)
  (let* ((code (buffer-substring-no-properties start end))
         (language (string-remove-suffix "-mode" (symbol-name major-mode)))
         (language (string-remove-suffix "-ts" language))
         (where (if buffer-file-name
                    (format "%s:%d-%d"
                            buffer-file-name
                            (line-number-at-pos start)
                            (line-number-at-pos end))
                  (buffer-name))))
    (deactivate-mark)
    (agent-shell-insert
     :submit t
     :text (format "Explain what this code does, from %s:\n\n```%s\n%s\n```"
                   where language code))))

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
