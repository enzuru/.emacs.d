;;; enzuru-large-language-models.el --- Large language model integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-efrit ()
  (let ((default-directory "~/.emacs.d/elpaca/repos/efrit/lisp"))
    (add-to-list 'load-path default-directory)
    (normal-top-level-add-subdirs-to-load-path))
  (require 'efrit))


(use-package efrit
  :ensure (:type git :host github :repo "riwatt/efrit")
  :config (enzuru-configure-efrit))

(use-package claude-code-ide
  :ensure (:type git :host github :repo "manzaltu/claude-code-ide.el" :rev :newest)
  :custom (claude-code-ide-terminal-backend 'eat)
  :config (claude-code-ide-emacs-tools-setup)
  :defer t)

(provide 'enzuru-large-language-models)

;;; enzuru-large-language-models.el ends here
