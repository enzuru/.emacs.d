;;; enzuru-cpp.el --- C++ programming language support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, cpp, c++, programming

;;; Commentary:

;; This module configures C++ programming language support with
;; Tree-sitter and Eglot for enhanced development experience.

;;; Code:

(defun enzuru-configure-c++-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.hh$" . c++-ts-mode))
  (add-hook 'c++-ts-mode-hook 'eglot-ensure)
  ;;(define-key c++-ts-mode-map (kbd "C-c d") 'enzuru-man-open)
  )

(enzuru-configure-c++-ts-mode)

(provide 'enzuru-cpp)

;;; enzuru-cpp.el ends here
