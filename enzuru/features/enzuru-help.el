;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-which-key ()
  (which-key-setup-side-window-right))

;; Packages

(use-package which-key
  :ensure t
  :defer t
  :config (enzuru-configure-which-key)
  :diminish which-key-mode)

(use-package helpful
  :ensure t
  :bind (("C-h c" . helpful-callable)
         ("C-h f" . helpful-function)
         ("C-h m" . helpful-macro)
         ("C-h c" . helpful-command)
         ("C-h k" . helpful-key)
         ("C-h v" . helpful-variable)
         ("C-h p" . helpful-at-point)))

(provide 'enzuru-help)
