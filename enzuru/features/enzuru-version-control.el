;;; enzuru-version-control.el --- Version control configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-magit-buffer-stale-p (&optional _noconfirm)
  "Return non-nil when the current Magit buffer is on screen.

Auto-revert refreshes stale buffers, so a displayed Magit buffer
follows changes made outside of Emacs.  Buffers that no window
shows are left alone, which keeps the refresh cost bounded."
  (and (get-buffer-window (current-buffer) 'visible) t))

(defun enzuru-configure-magit-buffer ()
  (setq-local buffer-stale-function #'enzuru-magit-buffer-stale-p))

;; Packages

(use-package transient
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :demand t
  :diminish magit-auto-revert-mode
  :bind (("C-c s" . magit-status)
         ("C-c p" . magit-push-current-to-upstream))
  :hook (magit-mode . enzuru-configure-magit-buffer)
  :custom
  (vc-follow-symlinks t)
  (global-auto-revert-non-file-buffers t)
  :config
  (global-auto-revert-mode t))

(provide 'enzuru-version-control)

;;; enzuru-version-control.el ends here
