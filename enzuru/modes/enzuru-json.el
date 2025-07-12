;;; enzuru-json.el --- JSON configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, json

;;; Commentary:

;; Configuration for JSON files.

;;; Code:

(defun enzuru-configure-json-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.json$" . json-ts-mode)))

(enzuru-configure-json-ts-mode)

(provide 'enzuru-json)

;;; enzuru-json.el ends here
