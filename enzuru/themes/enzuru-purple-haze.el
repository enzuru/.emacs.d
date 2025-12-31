;;; enzuru-purple-haze.el --- Purple Haze theme configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-purple-haze-theme ()
  (load-theme 'purple-haze t)
  (sml/apply-theme 'respectful))

;; Packages

(use-package purple-haze-theme
  :ensure (:host github :repo "emacsfodder/emacs-purple-haze-theme")
  :config (enzuru-configure-purple-haze-theme))

(provide 'enzuru-purple-haze)

;;; enzuru-purple-haze.el ends here
