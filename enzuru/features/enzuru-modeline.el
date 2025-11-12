;;; enzuru-modeline.el --- Mode line configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-sml ()
  (sml/setup))

;; Packages

(use-package smart-mode-line
  :ensure t
  :custom
  (sml/mode-width 'full)
  (sml/name-width 20)
  (sml/shorten-modes t)
  (sml/no-confirm-load-theme t)
  :config (enzuru-configure-sml))

;; Variables

(column-number-mode t)

(provide 'enzuru-modeline)

;;; enzuru-modeline.el ends here
