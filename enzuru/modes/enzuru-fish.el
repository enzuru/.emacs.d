;;; enzuru-fish.el --- Fish shell scripting support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-fish-completion ()
  (when (and (executable-find "fish")
             (require 'fish-completion nil t))
    (global-fish-completion-mode)))

;; Packages

;; (use-package emacs-fish-completion
;;   :ensure t
;;   :defer t
;;   :config (enzuru-configure-fish-completion))

(use-package fish-mode
  :ensure t
  :defer t
  :hook ((fish-mode . eglot-ensure)))

(provide 'enzuru-fish)

;;; enzuru-fish.el ends here
