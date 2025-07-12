;;; enzuru-gemini.el --- Gemini protocol browser configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, gemini, gopher, elpher

;;; Commentary:

;; This module configures Elpher for browsing Gemini and Gopher protocols.

;;; Code:

;; Functions


;; Packages

(use-package elpher
  :ensure t
  :defer t
  :custom
  (elpher-default-url-type "gemini"))

(provide 'enzuru-gemini)

;;; enzuru-gemini.el ends here
