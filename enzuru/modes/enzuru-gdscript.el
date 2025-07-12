;;; enzuru-gdscript.el --- GDScript programming language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, gdscript, godot, game-development

;;; Commentary:

;; This module configures GDScript programming language support for Godot game development.

;;; Code:

;; Packages

(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure))

(provide 'enzuru-gdscript)

;;; enzuru-gdscript.el ends here
