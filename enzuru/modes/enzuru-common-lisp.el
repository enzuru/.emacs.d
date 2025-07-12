;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-sly-repl-ansi-color ()
  (add-to-list 'sly-contribs 'sly-repl-ansi-color))

(defun enzuru-sly-describe-symbol-at-point ()
  (interactive)
  (sly-describe-symbol (word-at-point)))

(defun enzuru-configure-completing-read-sly ()
  (require 'completing-read-sly)
  (define-key lisp-mode-map (kbd "C-c i") 'completing-read-sly)
  (add-hook 'sly-mode-hook (lambda ()
                             (define-key sly-mode-map (kbd "C-c i") 'completing-read-sly))))

(defun enzuru-sly-eval-to-repl ()
  (interactive)
  (sly-eval-buffer)
  (switch-to-buffer-other-window "*sly-mrepl for sbcl*")
  (end-of-buffer))

;; Packages

(use-package sly
  :ensure t
  :bind ((:map sly-mode-map
               ("C-c i" . completing-read-sly)
               :map lisp-mode-map
               ("C-c d" . enzuru-sly-describe-symbol-at-point)
               ("C-c o" . enzuru-sly-eval-to-repl)
               ("C-c i" . completing-read-sly)
               ("C-x r" . sly-eval-region))))

(use-package sly-quicklisp
  :ensure t
  :defer t)

(use-package sly-repl-ansi-color
  :ensure (:host github :repo "PuercoPop/sly-repl-ansi-color")
  :config (enzuru-configure-sly-repl-ansi-color))

(use-package completing-read-sly
  :ensure (:host github :repo "enzuru/completing-read-sly")
  :defer t
  :config (enzuru-configure-completing-read-sly))

(add-hook 'elpaca-after-init-hook 'enzuru-configure-completing-read-sly)

(provide 'enzuru-common-lisp)
