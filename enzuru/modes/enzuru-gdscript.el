;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure))

(provide 'enzuru-gdscript)
