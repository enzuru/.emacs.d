;;; enzuru-gdscript.el --- GDScript programming language support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Packages

(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure))

(provide 'enzuru-gdscript)

;;; enzuru-gdscript.el ends here
