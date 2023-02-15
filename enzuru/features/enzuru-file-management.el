;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-efar ()
  (setq efar-open-all-files-in-emacs t))

;; Packages

(use-package efar
  :ensure t
  :config (enzuru-configure-efar)
  :bind (("C-x f" . efar)))

(provide 'enzuru-file-management)
