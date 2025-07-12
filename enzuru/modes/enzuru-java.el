;;; enzuru-java.el --- Java programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, java

;;; Commentary:

;; Configuration for Java programming.

;;; Code:

(defun enzuru-configure-java-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.java$" . java-ts-mode)))

(enzuru-configure-java-ts-mode)

(provide 'enzuru-java)

;;; enzuru-java.el ends here
