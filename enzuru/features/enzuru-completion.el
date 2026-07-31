;;; enzuru-completion.el --- Completion framework configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-set-truncate-lines ()
  "Keep minibuffer lines unwrapped."
  (setq truncate-lines t))

;; Packages

(use-package minibuffer
  :ensure nil
  :bind ( :map minibuffer-visible-completions-up-down-map
          ("C-n" . minibuffer-next-completion)
          ("C-p" . minibuffer-previous-completion))
  :hook ((minibuffer-setup . cursor-intangible-mode)
         (minibuffer-setup . enzuru-set-truncate-lines))
  :custom
  (tab-always-indent 'complete)
  (completion-auto-help t)
  (completion-auto-select t)
  (completion-eager-update t)
  (completion-eager-display t)
  (minibuffer-visible-completions 'up-down)
  (completion-ignore-case t)
  (completion-show-help nil)
  (completion-styles '(partial-completion flex initials))
  (completions-format 'one-column)
  (completions-max-height 10)
  (completions-sort 'historical)
  (enable-recursive-minibuffers t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (minibuffer-prompt-properties
   '(read-only t intangible t cursor-intangible t face minibuffer-prompt))
  (minibuffer-depth-indicate-mode t)
  (minibuffer-electric-default-mode t))

(provide 'enzuru-completion)

;;; enzuru-completion.el ends here
