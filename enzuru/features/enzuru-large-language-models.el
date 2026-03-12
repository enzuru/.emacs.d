;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(use-package agent-shell
  :ensure t
  :defer t)

(defun enzuru-configure-efrit ()
  (let ((default-directory "~/.emacs.d/elpaca/repos/efrit/lisp"))
    (add-to-list 'load-path default-directory)
    (normal-top-level-add-subdirs-to-load-path))
  (require 'efrit))

(use-package efrit
  :ensure (:type git :host github :repo "riwatt/efrit")
  :config (enzuru-configure-efrit))

(provide 'enzuru-large-language-models)

;;; enzuru-large-language-models.el ends here
