;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-lispy ()
  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
  (setf lispy-eval-display-style "overlay")
  (cl-pushnew 'cider lispy-compat))

;; Packages

(use-package lispy
  :ensure t
  :config (enzuru-configure-lispy)
  :hook ((emacs-lisp-mode . lispy-mode)
         (ielm-mode . lispy-mode)
         (lisp-mode . lispy-mode)
         (lisp-interaction-mode . lispy-mode)
         (geiser-repl-mode . lispy-mode)
         (sly-mrepl-mode . lispy-mode)
         (cider-repl-mode . lispy-mode)
         (clojure-mode . lispy-mode)
         (scheme-mode . lispy-mode)))

(provide 'enzuru-lisp)
