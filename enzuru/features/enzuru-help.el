;;; enzuru-help.el --- Help system configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-which-key ()
  (which-key-setup-side-window-right)
  (which-key-mode))

;; Packages

(use-package which-key
  :ensure t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(use-package helpful
  :ensure t
  :bind (("C-h c" . helpful-command)
         ("C-h f" . helpful-function)
         ("C-h k" . helpful-key)
         ("C-h m" . helpful-macro)
         ("C-h p" . helpful-at-point)
         ("C-h v" . helpful-variable)
         ("C-h x" . helpful-callable)))

(add-hook 'elpaca-after-init-hook 'enzuru-configure-which-key)

(provide 'enzuru-help)

;;; enzuru-help.el ends here
