;;; enzuru-modal-editing.el --- Modal editing configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, editing, modal, meow, lispy

;;; Commentary:

;; This module configures modal editing using Meow and Lispy for
;; efficient text manipulation and Lisp editing.

;;; Code:

;; Functions

(defun enzuru-configure-meow-after-elpaca ()
  (meow-leader-define-key '("k" . "C-c k"))
  (meow-leader-define-key '("d" . "C-c d"))
  (meow-leader-define-key '("o" . "C-c o"))
  (meow-leader-define-key '("i" . "C-c i"))
  (global-set-key (kbd "C-c k") 'enzuru-volatile-kill-buffer))

(defun enzuru-configure-lispy ()
  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
  (cl-pushnew 'cider lispy-compat))

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))

  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))

  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . consult-yank-from-kill-ring)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))

(defun enzuru-configure-meow ()
  (meow-setup)
  (meow-global-mode 1)
  (cl-pushnew '(sly-mrepl-mode . insert) meow-mode-state-list)
  (cl-pushnew '(inferior-emacs-lisp-mode . insert) meow-mode-state-list)
  (cl-pushnew '(eat-mode . insert) meow-mode-state-list)
  (cl-pushnew '(text-mode . insert) meow-mode-state-list)
  (cl-pushnew '(erc-mode . insert) meow-mode-state-list))

;; Packages

(use-package meow
  :ensure t
  :custom
  (meow-use-clipboard t)
  :config (enzuru-configure-meow))

(use-package lispy
  :ensure (:host github :repo "enzuru/lispy")
  :bind (("C-y" . consult-yank-from-kill-ring))
  :custom
  (lispy-eval-display-style "overlay")
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

(add-hook 'elpaca-after-init-hook 'enzuru-configure-meow-after-elpaca)

(provide 'enzuru-modal-editing)

;;; enzuru-modal-editing.el ends here
